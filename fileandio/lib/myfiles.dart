import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


class MyFiles extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Files'),),
      body:Center(
        child: RaisedButton(
          child: Text('Get directory'),
          color: Colors.blue,
          onPressed: (){
            testFun();
          },
        ),
      ),
    );  
  }

  void testFun() async{
    print('path:${await _localPath}');
  }

  Future<String> get _localPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeData(int counter) async{
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  Future<String> readData() async{
    final file = await _localFile;
    return file.readAsString();
  }

}