import 'package:flutter/material.dart';
import 'mypadding.dart';
import 'mylimitedcontainer.dart';
import 'mydecoratedbox.dart';
import 'mycontainer.dart';
import 'myscoffoldroute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Home'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color:Colors.lightBlue,
              child: Text('Padding'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new MyPadding()
                  )
                );
              },
            ),

            RaisedButton(
              color:Colors.lightBlue,
              child: Text('LimitedContainer'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new MyLimitedContainer()
                  )
                );
              },
            ),
           RaisedButton(
              color:Colors.lightBlue,
              child: Text('DecoratedBox'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new MyDecratedBox()
                  )
                );
              },
            ),
            RaisedButton(
              color:Colors.lightBlue,
              child: Text('Container'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new MyContainer()
                  )
                );
              },
            ),
            RaisedButton(
              color:Colors.lightBlue,
              child: Text('ScoffoldRoute'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new MyScoffoldRoute()
                  )
                );
              },
            )              
          ],
        ),
      ),
    );
  }
}


