import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudnet/view/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:cloudnet/view/widget/gColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloudnet/view/widget/modal_bottom_sheet.dart' as m;
import 'package:cloudnet/view/widget/ModalWithScroll.dart';

typedef ValueSelectedChanged<int,T> = void Function(int index,T value);

// extension ListExtension<E> on List<E> {
//   void addAllUnique(Iterable<E> iterable) {
//     for (var element in iterable) {
//       if (!contains(element)) {
//         add(element);
//       }
//     }
//   }
// }

Widget gNetworkImage(
    {required String imageUrl,  double? width, double? height, BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => Center(child: Container(width: 30,height: 30,child: CircularProgressIndicator())),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: fit,
    width: width,
    height: height,
  );
}

Widget gInputText({
  required String placeholder,
  bool isRequire = false,
  bool readOnly = false,
  TextEditingController? controller,
  GestureTapCallback? onTap,
  ValueChanged<String>? onChanged,
  VoidCallback? onClear,
  FormFieldValidator<String>? validator,
  int? maxLines = 1,
  int? minLines = 1,
  bool numberOnly = false,
  Widget? suffixIcon,
   TextInputType? keyboardType,
  ValueChanged<String>? onSubmitted}
    ){
  return  MyInputText(
    controller: controller,
    width: double.maxFinite,
    isRequire:isRequire,
    readOnly:readOnly,
    validator:validator,
    minLines: minLines,
    maxLines: maxLines,
    keyboardType:keyboardType,
    height: 50,
    duration: Duration(milliseconds: 300),
    suffixIcon: (suffixIcon ?? Icon(Icons.close)),
    onClickSuffix: onClear != null? onClear: (){
      if(controller != null)
        controller.clear();
    },
    placeholder: placeholder,
    onTap: onTap,
    onChanged: onChanged,
    onSubmitted: onSubmitted,

  );
}


Widget gInputSelect<T>({
  required BuildContext context,
  required String placeholder,
  bool isRequire = false,
  bool readOnly = false,
  TextEditingController? controller,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
  required VoidCallback onClear,
  ValueSelectedChanged<int,T?>? onSelect,
  required List<ListModel<T>> gList
}
    ){
  
  List<ListModel<T>> l = <ListModel<T>>[];
  gList.asMap().forEach((i,e) {
    l.add(ListModel<T>(key: e.key, title: e.title,data: e.data,onSelect: (d){
      if(onSelect != null) {
        onSelect.call(i, d);
        if (controller != null)
          controller.text = e.title;
        Navigator.of(context).pop();
      }
    }));
  });
  
  return  gInputText(
      placeholder:placeholder,
      isRequire:isRequire ,
      readOnly:true ,
      controller:controller,
      onClear: (){
        onClear();
        if(controller != null)
          controller.clear();
      },
      onTap:() async{
        if(readOnly == false){
          await m.gShowModalBottomSheet(context: context,expand: false, widget: ModalWithScroll<T>(
              gList:  l
          ));
        }
      },
      onChanged:onSubmitted,
      onSubmitted:onSubmitted
  );
}


Widget gGlobeSOText() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'Globe',
        style: GoogleFonts.portLligatSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: gColorYellow1,
        ),
        children: [
          TextSpan(
            text: 'SO',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}

Widget gSubmitButton({required String title,double? width,GestureTapCallback? onTap,double? height}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // width: MediaQuery.of(context).size.width,
      height: height??60,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: gColorsGreenButton)),

      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
