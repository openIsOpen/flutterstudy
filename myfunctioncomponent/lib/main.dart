import 'package:flutter/material.dart';
import 'mydatashare.dart';
import 'mydialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('DataShare'),
            color: Colors.lightBlue,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InheritedWidgetTestRoute()));
            }
          ),
          RaisedButton(
            child: Text('ComponentShare'),
            color: Colors.lightBlue,
            onPressed: (){}
          ),
          RaisedButton(
            child: Text('ColorAndTheme'),
            color: Colors.lightBlue,
            onPressed: (){}
          ),
          RaisedButton(
            child: Text('AsyncUI'),
            color: Colors.lightBlue,
            onPressed: (){}
          ),
          RaisedButton(
            child: Text('Diaglog'),
            color: Colors.lightBlue,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>myDialog()
              ));
            }
          )
          ,RaisedButton(
            child: Text('DataShare'),
            color: Colors.lightBlue,
            onPressed: (){}
          )
        ],
      ),
    );
  } 
}
