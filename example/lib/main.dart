import 'package:cloudnet/view/widget/ModalWithScroll.dart';
import 'package:cloudnet/view/widget/checkbox_list.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cloudnet/cloudnet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  List<ListModel<String>> listData = [];
  @override
  void initState() {
   // initPlatformState();
    
    listData.add(ListModel<String>(key: 'a',title: 'A',data: 'AA'));
    listData.add(ListModel<String>(key: 'b',title: 'B',data: 'BB'));
    listData.add(ListModel<String>(key: 'c',title: 'C',data: 'CC'));
    listData.add(ListModel<String>(key: 'd',title: 'D',data: 'DD'));
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Cloudnet.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:  CheckboxList<String>(listData: listData,onMultipleSelect: (d){
          debugPrint('DDDDDDD: ${d.map((e) => e.data).join(' , ')}'); 
        },)
        
        // ListView(
        //   children: [
        //     // Center(
        //     //   child: Text('Running on: $_platformVersion\n'),
        //     // ),
        //     CheckboxList<String>(listData: listData,onMultipleSelect: (d){
        //       debugPrint('DDDDDDD: ${d.join(' , ')}');
        //     },)
        //   ],
        // ),
      ),
    );
  }
}
