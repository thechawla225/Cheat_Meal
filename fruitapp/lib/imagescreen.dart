import 'dart:html';

import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File file;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){Navigator.pop(context);},),
          ),
        body: SingleChildScrollView(
        child:
        ShowImage(file),
      
      
      ),
      )
    );
  }
}

Widget ShowImage(file){

}