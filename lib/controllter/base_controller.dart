import 'package:cloudnet/helper/dialog_helper.dart';
import 'package:cloudnet/helper/error.dart';

class BaseController{
  void handleError(error){
    if(error is BadRequestException){
      DialogHelper().showErrorDialog(title: 'Bad Request',description: error.message); 
    }
    else if(error is FetchDataException){
      DialogHelper().showErrorDialog(title: 'Fetch Data',description: error.message);
    }
    else if(error is ApiNotRespondingException){
      DialogHelper().showErrorDialog(title: 'Api Not Responding',description: error.message);
    }
  }
}