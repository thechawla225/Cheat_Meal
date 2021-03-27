import 'package:flutter/material.dart';
import 'dart:io';
import 'product_screen.dart';
import 'list_items.dart';
import 'api.dart';
import 'dart:convert';

class ShowImage extends StatelessWidget {
  var identifier = { 
    "Orange":0 ,
    "Banana":1 ,
    "Apple":2,
    "Mango":3,
    "Apricot":4,
    "Avocado":5, 
    "Blueberry":6,
    "Cauliflower":7,
    "Coconut":8,
    "Eggplant":9,
    "Hazelnut":10,
    "Kiwi":11,
    "Lime":12
    };
  File file;
  var Data;
  bool found;
  ShowImage({this.file});
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () async{
                        Data = await ImageSender(file);
                        var DecodedData = jsonDecode(Data);
                        String myitem = DecodedData['prediction'];
                        print("Data Recived, the item is ");
                        print(myitem);
                        print("Now, pushing ");
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductScreen(
                              item: listItems[identifier[myitem]],
                            )));
                      },
                    ),
            ),
          ],
        ),
      
      ),
      )
    );
  }
}