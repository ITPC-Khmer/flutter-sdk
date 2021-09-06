import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showModalBottomSheet(BuildContext context,Widget w) async{
  await showMaterialModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: w,
    ),
  );
}