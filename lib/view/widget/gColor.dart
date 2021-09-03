import 'package:flutter/material.dart';

var textStyleTitleDialog =TextStyle(fontSize: 14,color: gColorGreen1,);
var textStyleDescriptionDialog =TextStyle(fontSize: 14,color: Colors.black);

List<Color> gColorsGreenButton = [Color(0xff048611),Color(0xff066602)];
List<Color> gColorsYellowButton = [Color(0xfffbb448), Color(0xfff7892b)];
Color gColorGreen1 = Color(0xff066c03);
Color gColorYellow1 = Color(0xfff79c4f);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
