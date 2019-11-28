import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharePreferences extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('SharePreferences'),),
      body:Center(
        child: RaisedButton(
          child: Text('Test'),
          color: Colors.blue,
          onPressed: () async{
            //save data
            print('save data');
            saveData('test', 123);
            int data =await readData('test');
            print('get data:$data');
          },
        ),
      )
    );
  }

  Future<void> saveData(String key,int value) async {
    final prefes = await SharedPreferences.getInstance();

    prefes.setInt(key, value);
  }

  Future<int> readData(String key) async{
    final prefes = await SharedPreferences.getInstance();
    return prefes.getInt(key);
  }
  

}