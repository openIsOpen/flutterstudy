import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(title: Text('Padding'),),
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('left:8'),
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 8),
              child: Text('vertical:8'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text('fromLTRB,20,20,20,20'),
            )
          ],
        ),
      )
    );
  }

}