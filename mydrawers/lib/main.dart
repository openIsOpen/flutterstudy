import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              ),
              ListTile(
                title: Text('Item1'),
                onTap: (){
                  print('Item1 onTap');
                  Navigator.of(context).pop(context);
                },
              ),
              ListTile(
                title: Text('Item2'),
                onTap: (){
                  print('Item2 onTap');
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
    );
  }

}

