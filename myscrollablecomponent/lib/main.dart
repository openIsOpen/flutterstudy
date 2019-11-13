import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'mysinglechildscrollview.dart';
import 'mylistview.dart';
import 'mygridview.dart';
import 'customscrollview.dart';
import 'scrollcontroller.dart';

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
        body: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new MySingleChildScrollView()));
              },
              child: Text('SingleChildScrollView'),
              color: Colors.lightBlue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new InfiniteListView()));
              },
              child: Text('ListView1'),
              color: Colors.lightBlue,
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new MyGridView()));
              },
              child: Text('GridView'),
              color: Colors.lightBlue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new MyGridView2()));
              },
              child: Text('GridView_MaxCross'),
              color: Colors.lightBlue,
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new InfiniteGridView()));
              },
              child: Text('GridView_Infine'),
              color: Colors.lightBlue,
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new CustomScrollViewTestRoute()));
              },
              child: Text('CustomScrollView'),
              color: Colors.lightBlue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new ScrollControllerTestRoute()));
              },
              child: Text('ScrollController'),
              color: Colors.lightBlue,
            )
          ],
        ));
  }
}

