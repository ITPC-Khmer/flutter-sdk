import 'package:cloudnet/controllter/base_controller.dart';
import 'package:cloudnet/helper/base_client.dart';
import 'package:image_picker/image_picker.dart';

class UserController with BaseController{
  void getData(){
    BaseClient().get('https://burmaso.com/', 'user/85')
        .catchError(handleError).then((x){
          
      print("XXXXXX = ${x?['idxxx']}");
    });
  }
  
  void uploadImage() async{
    var data = {
      "title":"title",
      "description":"description",
      "link":"link",
      "location_id":"0",
      "link_type":"internal",
      "start_date":"2021/01/01",
      "end_date":"2021/01/01",
      "market_id":"0",
    };
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    
    BaseClient().uploadImage(baseUrl: "https://khmerso.com/api/",api: "save-advertise",data: data,imageFile: image, fieldImageName: 'image')
        .catchError(handleError).then((x){

      print("XXXXXX = $x");
    });
    
    
  }
  
  
  void uploadMultiImage(List<XFile>? images) async{
    var data = {
      "title":"title",
      "description":"description",
      "link":"link",
      "location_id":"0",
      "link_type":"internal",
      "start_date":"2021/01/01",
      "end_date":"2021/01/01",
      "market_id":"0",
    };
    final ImagePicker _picker = ImagePicker();
   // final List<XFile>? images = await _picker.pickMultiImage(imageQuality: 50);
    
    BaseClient().uploadMultiImage(baseUrl: "https://khmerso.com/api/",api: "save-advertise",data: data,imageFiles: images, fieldImageName: 'image')
        .catchError(handleError).then((x){

      print("XXXXXX = $x");
    });
    
    
  }
  
  
}