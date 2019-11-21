import 'package:flutter/material.dart';

class MyPageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageRoute'),),
      body: Center(
        child: RaisedButton(
          child: Text('Page2'),
          color: Colors.blue,
          onPressed: (){
            Navigator.push(context, _createRoute());
          },
        ),
      ),
    );
  }

  Route _createRoute()
  {
    return PageRouteBuilder(
      pageBuilder: ,
      transitionsBuilder: ,
    );
  }

}

