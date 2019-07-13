import 'package:flutter/material.dart';

class hotWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return hotWidgetState();
  }
}
class hotWidgetState extends State<hotWidget>{
    @override
    Widget build(BuildContext context){
      return Center(
          child: Text('热门'),
        );
    }
}