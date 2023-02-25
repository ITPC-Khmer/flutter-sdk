import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> gShowModalBottomSheet(
    {required BuildContext context,
    bool expand = false,
    required widget}) async {
  // await showMaterialModalBottomSheet(
  //   expand: expand,
  //   context: context,
  //   backgroundColor: Colors.transparent,
  //   builder: (context) => widget,
  // );

  await showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        color: Colors.grey,
        child: widget,
      );
    },
  );
}
