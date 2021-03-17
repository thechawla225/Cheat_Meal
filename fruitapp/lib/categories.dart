import 'package:flutter/material.dart';
import 'list_items.dart';
import 'dart:async';
import 'product_screen.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> 
{
 int selectedindex = 0;
 ScrollController _controller = ScrollController();
  @override
void intiState()
{
 this._controller.addListener(() { 
   _selectCategoryIndex();
 });
 super.initState();
}

_selectCategoryIndex()
{
  Timer(Duration(microseconds: 400), ()
  {
    var newIndex = _controller.offset / 210;
    if(newIndex.round() != selectedindex)
    {
      setState(() {
        selectedindex = newIndex.round();
      });
    }
  });
  }

_scrolltoItem(index)
{
  double position = index*210.0;
  _controller.animateTo(position,duration: Duration(microseconds: 400), curve: Curves.easeInOut);
}
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
      height: 45.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
              setState(() {
                  selectedindex = index;
                });
              _scrolltoItem(selectedindex);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                                style: selectedindex == index ? BorderStyle.solid : BorderStyle.none
                                    ))),
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      listItems[index].name,
                      style: TextStyle(
                          color: selectedindex == index ? Colors.black:Colors.grey,
                          fontSize: 16.0,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            );
          }),
    ),

    Container(
      height: 360.0,
      margin: EdgeInsets.only(top:20),
      child: ListView.builder(
        itemCount: listItems.length,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (BuildContext, int index){
          return GestureDetector(
            onTap: ()
            {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductScreen(
                                  item: listItems[index],
                                )));
            },
                      child: Container(
              margin:EdgeInsets.only(left: 10,right: 10.0,bottom: 20.0),
              width: 210.0,
              decoration: BoxDecoration(
                color: Color(int.parse(listItems[index].color)),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0, 
                    offset: Offset(0,30),
                    color: Color(int.parse(listItems[index].color)).withOpacity(0.6),
                    spreadRadius: -20.0,
                    )
                  
                  ]),
              child: Column(children: [
                Text(listItems[index].name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),
                Hero(
                  tag: listItems[index].name,
                    child: Image(
                    image: AssetImage("assets/" + listItems[index].image),
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                  child: Text(listItems[index].description,style: TextStyle(color: Colors.white,fontSize: 12.0),)),
                SizedBox(height: 10.0),

                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                    child: Text(
                      "Add to Favorites",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    onPressed: () {
                       
                    },
                  )
                
                ],
              ),
              ),
          );


        },
      ),
    ),

    ]);
  }
}
