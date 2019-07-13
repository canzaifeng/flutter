import 'package:flutter/material.dart';

class searchItemWidget extends StatefulWidget{
  String search_item;
  searchItemWidget(this.search_item);
  @override
  State<StatefulWidget> createState(){
    return searchItemState();
  }
}
class searchItemState extends State<searchItemWidget>{
    @override
    Widget build(BuildContext context){
      return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  widget.search_item,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
              );
    }
}