import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloudnet/view/widget/gColor.dart';

class DialogHelper{

  void showDialog({required String title,String description = "Something went wrong"})  {
     showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: Get.context as BuildContext,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200,
            child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children:  <Widget>[
                          SizedBox(height: 20,),
                          Text(title,style: textStyleTitleDialog,),
                          SizedBox(height: 20,),
                          Expanded(child: Text(
                            description,
                            style: textStyleDescriptionDialog
                            ,overflow: TextOverflow.ellipsis,
                            maxLines: 2,)),
                          ElevatedButton(
                              onPressed:(){
                                if(Get.isDialogOpen == true)Get.back();
                              },
                              child: Text("OK")
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
  //show error dialog
  void showErrorDialog({required String title,String description = "Something went wrong"}){
    showDialog(title: title,description: description);

    // Get.dialog(
    //     Dialog(
    //       child: SingleChildScrollView(
    //           child: Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: ListBody(
    //               children:  <Widget>[
    //                 Text(title),
    //                 Text(description),
    //                 ElevatedButton(
    //                     onPressed:(){
    //                       if(Get.isDialogOpen == true)Get.back();
    //                     }, 
    //                     child: Text("OK")
    //                 )
    //               ],
    //             ),
    //           ),
    //       )
    //     )
    // );

  }
}