import 'package:flutter/material.dart';


class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap'),),
      body: Wrap(
        direction:Axis.horizontal,
        spacing: 8,
        runSpacing: 4,
        alignment:WrapAlignment.start,
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),), label: new Text('Hamilton'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('M'),), label: new Text('Lafayette'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('H'),), label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('J'),), label: new Text('Laurens'),
          )                              
        ],
      ),
    );
  }
  
}

class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align'),),
      body: Container(
        //height: 120.0,
        //width: 120.0,
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          heightFactor: 2,
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      )
    );
  }
  
}

