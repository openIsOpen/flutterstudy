import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = 'null';
  int _fileCount = 0;
  int _folderCount = 0;
  int _exceptionCount = 0;

  Future<void> getPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      }
    } else if (Platform.isIOS) {}
  }

  void _getMusics() async {
    await getPermission();
    var dir = await getExternalStorageDirectory();
    print(dir.path);
    getFiles(dir.path).then((onValue) {
      setState(() {
        _counter = 'complete 文件个数-:${result.length}';
      });
    });
  }

  List<String> result = new List<String>();

  Future<void> getFiles(String path) async {
    try {
      Directory dir = Directory(path);
      var files = dir.list();
      files.forEach((f) {
        if (!FileSystemEntity.isFileSync(f.path)) {
          _folderCount ++;
          setState(() {
            _counter = f.path;
          });
          getFiles(f.path);
          
        } else {
          _fileCount ++;
          result.add(f.path);
          setState(() {
            _counter = f.path;
          });
        }
      });
    } catch (e) {
      _exceptionCount++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'File Count:$_fileCount',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Folder Count:$_folderCount',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Exception Count:$_exceptionCount',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Scan:$_counter',
              //style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getMusics,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
