import 'package:flutter/material.dart';
import 'package:fruitapp/list_items.dart';

class ProductScreen extends StatelessWidget {
  final ListItem item;
  ProductScreen({this.item});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(int.parse(item.color))),
      home:
      Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
                    OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      
                      side:BorderSide(color: Colors.white,width: 2),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                      
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 7.0),
                      backgroundColor: Colors.black.withOpacity(0.1),
                    ),
                      child: Text(
                        "Buy some " + item.name,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      onPressed: () {
                         
                      },
                    ),
          appBar: AppBar(
            elevation: 0,
            leading: 
            IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white),
            onPressed: () {Navigator.pop(context);},
            ),
            ),
          backgroundColor: Color(int.parse(item.color)),
          body:
            SingleChildScrollView(
                child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10),
                    Center(child: Text(item.name, style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,color: Colors.white,),),

                    ),
                    Center(child: 
                    Hero(
                      tag: item.name,
                      child: Image(image: AssetImage("assets/" + item.image),
                      height: 300.0,
                      width: 300.0,
                      
                      ),
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                          child: Text("Description",
                          textAlign: TextAlign.left,
                          style: TextStyle(color:Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                      ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                            child: Text(item.longDescription,
                            textAlign: TextAlign.left,
                            style: TextStyle(color:Colors.white,
                            fontSize: 16.0,
                            ),
                    ),
                        ),
                        
                    ],
                ),
              ),
            ),
            ),
    );
  }
}