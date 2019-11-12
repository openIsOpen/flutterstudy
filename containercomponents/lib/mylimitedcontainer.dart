import 'package:flutter/material.dart';


class MyLimitedContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedContainer'),),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50
            ),
            child: Container(
              color: Colors.red,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: redBox,
          )
        ],
      ),
    );
  }

}

Widget redBox=DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);