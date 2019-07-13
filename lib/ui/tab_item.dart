import 'package:flutter/material.dart';

class tabItemWidget extends StatefulWidget{
  String tabItem;
  tabItemWidget(this.tabItem);
  @override
  State<StatefulWidget> createState(){
    return tabItemState();
  }
}
class tabItemState extends State<tabItemWidget>{
    @override
    Widget build(BuildContext context){
      return  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 46,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        // Positioned(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       // borderRadius:
                        //       // BorderRadius.all(Radius.circular(4)),
                        //       border:
                        //           Border.all(width: 2, color: Colors.grey[200]),
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.red, shape: BoxShape.circle),
                        //       height: 8,
                        //       width: 8,
                        //     ),
                        //   ),
                        //   right: 0,
                        //   top: 10,
                        // ),
                        Text(widget.tabItem)
                      ],
                    )
				);
    }
}