class AppException implements Exception{
  final dynamic message;
  final dynamic prefix;
  final dynamic url;
  AppException([this.message,this.prefix,this.url]);
}

class BadRequestException extends AppException{
  BadRequestException([dynamic message,dynamic url]):super( message, "Bad Request", url);
}

class FetchDataException extends AppException{
  FetchDataException([dynamic message,dynamic url]):super( message, "Unable to process", url);
}

class ApiNotRespondingException extends AppException{
  ApiNotRespondingException([dynamic message,dynamic url]):super( message, "Api Not Responding", url);
}

class UnAuthorizeException extends AppException{
  UnAuthorizeException([dynamic message,dynamic url]):super( message, "Api Un Authorize", url);
}