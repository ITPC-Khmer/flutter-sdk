import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloudnet/helper/error.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart'; 
class BaseClient{
  static const TIME_OUT_DURATION = 60;
  //GET
  Future<dynamic> get(String baseUrl,String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION)); 
      return _processResponse(response);
    }
    on SocketException{
      throw FetchDataException("No internet connection",uri.toString());
    }
    on TimeoutException{
      throw ApiNotRespondingException("Api not responded in time ",uri.toString());
    }
  }
  
  //POST
  Future<dynamic> post(String baseUrl,String api,Object? body) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.post(uri,body:body).timeout(Duration(seconds: TIME_OUT_DURATION));
      return await _processResponse(response);
    }
    on SocketException{
      throw FetchDataException("No internet connection",uri.toString());
    }
    on TimeoutException{
      throw ApiNotRespondingException("Api not responded in time ",uri.toString());
    }
  }

  Future<dynamic> uploadImage({required String baseUrl,required String api, XFile? imageFile,required String fieldImageName,Map<String, dynamic>? data,String id = "0"}) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      return imageFile!.readAsBytes().then((f) async {
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(fieldImageName, f,filename: fieldImageName);
        var request = new http.MultipartRequest("POST", uri);
        print("multipartFile ${multipartFile.field}");
        print("multipartFile ${multipartFile.contentType.mimeType}");
        request.files.add(multipartFile);
        data!.forEach((k,v) {
          request.fields[k] = v.toString();
        });
        
        if(id != "0"){
          request.fields["id"] = id.toString();
        }
        
        var response = await request.send().timeout(Duration(seconds: TIME_OUT_DURATION * 5));
        return await http.Response.fromStream(response).then((res) async{return await _processResponse(res);});
      });
    } on SocketException{
      throw FetchDataException("No internet connection",uri.toString());
    }
    on TimeoutException{
      throw ApiNotRespondingException("Api not responded in time ",uri.toString());
    }
  }
  
  Future<dynamic> uploadMultiImage({required String baseUrl,required String api, List<XFile?>? imageFiles,required String fieldImageName,Map<String, dynamic>? data,String id = "0",int v=0}) async {
    var r =  await uploadImage(
        api: api,
        data: data,
        baseUrl: baseUrl,
        imageFile: imageFiles![v],
        fieldImageName: fieldImageName,
        id: id
    );
    
    if(v == imageFiles.length -1){
      return r;
    }else{
      var idX = "0";
      try{
         idX = r["id"]?r["id"]:"0";
      }catch(_){}
      
      return await uploadMultiImage(
          api: api,
          data: data,
          baseUrl: baseUrl,
          imageFiles: imageFiles,
          fieldImageName: fieldImageName,
          v: v+1,
          id: idX
      );
    }
    
  }
  
  dynamic _processResponse(http.Response response){
    switch (response.statusCode){
      case 200:
        var responseJson = utf8.decoder.convert(response.bodyBytes);
        return json.decoder.convert(responseJson);
      case 400:
        throw BadRequestException(utf8.decoder.convert(response.bodyBytes),response.request!.url.toString());
      case 401:
      case 403:
      throw UnAuthorizeException(utf8.decoder.convert(response.bodyBytes),response.request!.url.toString());
      case 500:
      default:
      throw FetchDataException("Error occurred with code ${response.statusCode}",response.request!.url.toString());

    }
  }
  
}