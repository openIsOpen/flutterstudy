import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'mysqltest.dart';
import 'myfiles.dart';
import 'mysharepreferences.dart';
import 'myplayvideo.dart';
import 'mycamera.dart';
import 'myqrscan.dart';

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
        home: MyHomePage());
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
            child: Text('Sql'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SqlTest();
              }));
            },
          ),
          RaisedButton(
            child: Text('Files'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyFiles();
              }));
            },
          ),
          RaisedButton(
            child: Text('Sharedata'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MySharePreferences();
              }));
            },
          ),
          RaisedButton(
            child: Text('PlayVideo'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyPlayVideo();
              }));
            },
          ),
          RaisedButton(
            child: Text('Camera'),
            color: Colors.blue,
            onPressed: () async {
              final cameras = await availableCameras();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TakePictureScreen(
                  camera: cameras.first,
                );
              }));
            },
          ),
          RaisedButton(
            child: Text('扫码测试'),
            color: Colors.blue,
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyQrScan();
              }));
            },
          )
        ],
      ),
    );
  }
}
