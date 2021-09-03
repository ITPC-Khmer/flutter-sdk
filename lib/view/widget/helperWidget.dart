import 'package:flutter/material.dart';
import 'package:cloudnet/view/widget/gColor.dart';
import 'package:google_fonts/google_fonts.dart';

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

Widget gSubmitButton({required String title,double? width,GestureTapCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // width: MediaQuery.of(context).size.width,
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

Widget gEntryField(String title, {bool isPassword = false}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  );
}
