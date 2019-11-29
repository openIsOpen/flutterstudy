import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


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

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage>{

  static const platform = const MethodChannel('demo.janhrastnik.com/info');

  @override
  void initState() {
    super.initState();
  }

  Future _getSdCard() async {
    var value;
    try {
        value = await platform.invokeMethod("getSdCardPath");
    } catch(e) {
      print(e);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Storage'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('GetExernalStorage'),
              color:Colors.blue,
              onPressed: () async {
                
                var dir = await getApplicationDocumentsDirectory();
                print('applicationDocumentDir:$dir');
                //dir = await getApplicationSupportDirectory();
                print('applicationsSupportDir:$dir');
                //dir = await getExternalStorageDirectories(StorageDirectory.downloads);
                dir = await getExternalStorageDirectory();
                //print('externalStorageDir:$dir,path:${dir.path}');
                var directory = Directory(dir.path);
                var files =  directory.listSync();
                files.forEach((f)=>print(f));
                var dir1 = await getExternalStorageDirectory();
                //var dir1 = await getExternalStorageDirectories();
                print('getExternalStorageDirectories:$dir1');
                //dir1.forEach((f){print(f);});
                var dir2 = await _getSdCard();
                print('dir2:$dir2');
                //var files =  dir.list();
                //print(await files.length);
                //files.forEach((i){print(i);});
                
              },
            )
          ],
        ),
      ),
    );
  }

}