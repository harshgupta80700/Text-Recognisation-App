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
