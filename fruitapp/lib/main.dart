import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'homescreen.dart';
import 'product_screen.dart';
import 'list_items.dart';
import 'show_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Data;
  final ImagePicker _picker = ImagePicker();
  File file;
  bool pressed = false;
  bool found = true;
  void PickImage()
  async{
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(pickedFile.path);
    setState(() {
      pressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cheat Meal',
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
              PickImage();

          },
          backgroundColor: Colors.white,
          child: Icon(Icons.camera_alt_outlined, color: Colors.black,),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: pressed? Icon(Icons.arrow_back):Icon(Icons.menu),
            onPressed:pressed? (){
              setState(() {
                pressed = false;
              });
            }:(){

            },
            ),
          ),
          body:pressed ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:5.0),
            child: ShowImage(file: file)
            ):HomeScreen(),
               )
    );
  }

}
