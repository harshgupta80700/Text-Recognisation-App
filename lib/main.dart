import 'package:flutter/material.dart';

import 'package:text_recognisation/mlkit.dart';

 void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MLKit(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool text = false;
//   List<String> texttoprint =[];
//   File imageFile;

//   Future<void> _showdialoguebox(BuildContext context){
//     return showDialog(context: context,builder: (BuildContext context){
//       return AlertDialog(
//         title: Text('Choose one',
//         ),
        
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               SizedBox(height: 15.0),
//               GestureDetector(
//                 child: Text('Gallery',
//         ),
//                 onTap: (){
//                   _opengallery(context);
//                 },
//               ),
//               SizedBox(height: 15.0),
//               GestureDetector(
//                 child: Text('Camera',
//        ),
//                 onTap: (){
//                   _opencamera(context);
//                 },
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   _opengallery(BuildContext context) async{
//     var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       imageFile = picture;
//       text= true;
//       texttoprint.clear();
//     });
//     Navigator.pop(context);
//     readtext();
// //Navigator.push(context, new MaterialPageRoute(builder: (context)=>MyHomePage(imageFile)));

//   }

//   _opencamera(BuildContext context) async{
//     var picture = await ImagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       imageFile = picture;
//       text=true;
//       texttoprint.clear();
//     });
//     Navigator.pop(context);
//     readtext();
//   //Navigator.push(context, new MaterialPageRoute(builder: (context)=>MyHomePage(imageFile)));

//   }

//   Future readtext() async {
//     FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
//     TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
//     VisionText visionText = await textRecognizer.processImage(visionImage);

//     for (TextBlock block in visionText.blocks) {
//       texttoprint.add(block.text.toString());
//       // for (TextLine line in block.lines) {
        
//       //   // setState(() {
//       //   //   texttoprint.add(line.text.toString());
//       //   // });
//       //   // for (TextElement word in line.elements) {
//       //   //   // setState(() {
//       //   //   //   texttoprint.add(word.text.toString());
//       //   //   //   text = text + word.text + ' ';
//       //   //   // });
//       //   // }
//       //   // text = text + '\n';
//       // }
//     }
//     textRecognizer.close();
//     print(texttoprint);
//     setState(() {
//       text=true;
//     });
//   }

//   Widget printtext(){
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//         children: texttoprint.map((e) {
//                return Container(
//                  padding: EdgeInsets.symmetric(horizontal: 5.0),
//                  child: Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
//                  child: Text(e),),
//                );
//              }).toList(),
//       ),
//   );
// }

//   Widget decider(){
//     if(imageFile==null){
//       return Text("no image found");
//     }
//     else return Image.file(imageFile,width: 400.0,height:400.0 
      
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//               child: SingleChildScrollView(
//                               child: Column(
//             children: <Widget>[
//                 SizedBox(height: 10.0),
//                 decider(),
//                 SizedBox(height: 20.0),
//                 FlatButton.icon(onPressed: (){_showdialoguebox(context);}, icon: Icon(Icons.camera_alt,size: 100,color: Colors.blue,), label: null),
//                 // imageLoaded
//                 //   ? Center(
//                 //       child: Container(
//                 //         width: MediaQuery.of(context).size.width,
//                 //       decoration: BoxDecoration(
//                 //         color: Colors.white,
//                 //         // boxShadow: const [
//                 //         //   BoxShadow(blurRadius: 20),
//                 //         // ],
//                 //       ),
//                 //       //margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
//                 //       height: MediaQuery.of(context).size.width,
//                 //       child: Image.file(
//                 //         widget._file,
//                 //         fit: BoxFit.contain,
//                 //       ),
//                 //     ))
//                 //   : Container(),
//                 SizedBox(height: 10.0),
//               text ?
//              printtext():
//              Container()
                
//             ],
//           ),
//               ),
//       ),
//     );
//   }
// }