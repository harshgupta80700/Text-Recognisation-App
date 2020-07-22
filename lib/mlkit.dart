import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';


class MLKit extends StatefulWidget {
  @override
  _MLKitState createState() => _MLKitState();
}

class _MLKitState extends State<MLKit> {
  File pickedImage;
  bool text = false;
  List<String> texttoprint =[];


  bool imageLoaded = false;

  Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
      texttoprint.clear();
    });
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {
      texttoprint.add(block.text.toString());
      // for (TextLine line in block.lines) {
        
      //   // setState(() {
      //   //   texttoprint.add(line.text.toString());
      //   // });
      //   // for (TextElement word in line.elements) {
      //   //   // setState(() {
      //   //   //   texttoprint.add(word.text.toString());
      //   //   //   text = text + word.text + ' ';
      //   //   // });
      //   // }
      //   // text = text + '\n';
      // }
    }
    textRecognizer.close();
    print(texttoprint);
    setState(() {
      text=true;
    });
  }

Widget printtext(){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
        children: texttoprint.map((e) {
               return Column(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width*0.9,
                     padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: Colors.cyan
                     ),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 5.0),
                       child: Text(e,textAlign: TextAlign.center,),
                     ),
                   ),
                   SizedBox(height:3.0)
                 ], 
               );
             }).toList(),
      ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                SizedBox(height: 10.0),
                imageLoaded
                  ? Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.width,
                      child: Image.file(
                        pickedImage,
                        fit: BoxFit.contain,
                      ),
                    ))
                  : Container(),
                SizedBox(height: 10.0),
                Center(
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.photo_camera,
                    size: 100,
                  ),
                  label: Text(''),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    pickImage();
                  },
                ),
                ),

             text ?
             printtext():
             Container()
                
            ],
          ),
              ),
      ),
    );
  }
}
