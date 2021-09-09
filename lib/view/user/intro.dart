import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloudnet/view/widget/ImageFromGalleryEx.dart';
import 'package:image_picker/image_picker.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>  {
  final transitionDuration = Duration(seconds: 1);
  List<XFile>? images = [];

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  void initState() {
    // UserController().getData();
   
    
    Future.delayed(Duration(seconds: 3), () {
     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage(title: "Welcome")), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _mySplash(),
    );
  }
  
  Widget _mySplash() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/splash.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "GlobeSO",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 40, 123, 61)),
                  ),
                  
                  MaterialButton(
                    color: Colors.blue,
                    child: Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async{
                      final ImagePicker _picker = ImagePicker();
                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
                      images!.add(image!);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      //UserController().uploadMultiImage(images);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: LinearProgressIndicator(backgroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
  
  
}
