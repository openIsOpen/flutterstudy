import 'package:flutter/material.dart';
import 'flexlayout.dart';
import 'wrapandflow.dart';

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

class  MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child:Text('Flex'),
            onPressed:(){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>FlexLayout()
                )
              );
            },
          ),
          RaisedButton(
            child:Text('Wrap'),
            onPressed:(){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>MyWrap()
                )
              );
            },
          ),
         RaisedButton(
            child:Text('Align'),
            onPressed:(){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>MyAlign()
                )
              );
            },
          )
        ],
      ),
    );
  }
  
}


