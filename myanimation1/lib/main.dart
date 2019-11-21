import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('PageRoute'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return null;
                }));
              },
            ),
            RaisedButton(
              child: Text('WidgetPhysics'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return null;
                }));
              },
            ),
            RaisedButton(
              child: Text('Animate the properties of a container'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return null;
                }));
              },
            ),
            RaisedButton(
              child: Text('Fade a widget in and out'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return null;
                }));
              },
            )
          ],
        ));
  }
}
