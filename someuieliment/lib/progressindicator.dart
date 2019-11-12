import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('ProgressIndicator'),),
      body: Center(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue)
            ),

            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              value: 0.8,
            ),

            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              strokeWidth: 6,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              value: .5,
              strokeWidth: 10,
            )


          ],
        ),
      ),
    );
  }

}