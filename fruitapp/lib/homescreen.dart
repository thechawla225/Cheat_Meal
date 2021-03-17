import 'package:flutter/material.dart';
import 'package:fruitapp/categories.dart';
import 'favorites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text("Fruits",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          ),
          Categories(),
          Favorites(),

        ],
      ),
      
    );
  }
}