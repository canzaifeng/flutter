import 'package:flutter/material.dart';

class mineWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return mineWidgetState();
  }
}
class mineWidgetState extends State<mineWidget>{
    @override
    Widget build(BuildContext context){
      return Center(
          child: Text('我的'),
        );
    }
}