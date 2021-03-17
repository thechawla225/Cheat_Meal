import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'homescreen.dart';

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
            child: ShowImage(file, context)):HomeScreen(),
               )
    );
  }

}

Widget ShowImage(file , BuildContext context){

  return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 150,),
            Image.file(file),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      
                      side:BorderSide(color: Colors.black,width: 2),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                      
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 7.0),
                      backgroundColor: Colors.black.withOpacity(0.1),
                    ),
                      child: Text(
                        "Show Details",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                      onPressed: () {
                        ImageSender(file); 
                      },
                    ),
            ),
          ],
        ),
      
      ),
      )
    );

}