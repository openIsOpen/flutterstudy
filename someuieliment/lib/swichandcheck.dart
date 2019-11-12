import 'package:flutter/material.dart';

class SwichAndCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwichAndCheckState();
  }
  
}

class SwichAndCheckState extends State<SwichAndCheck> {
  bool _swichSelected = true;
  bool _checkSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swich&Check')),
      body:Column(
        children: <Widget>[
          Switch(
            value: _swichSelected,
            onChanged: (bool value) {
              print(value);
              setState(() {                
                _swichSelected = value;
              });
            },
          ),
          Checkbox(
            activeColor: Colors.red, //选中时的颜色
            value: _checkSelected, 
            onChanged: (bool value) {
              setState(() {
                _checkSelected = value;  
              });
              
            },
          )
        ],
      ),
    );
  }
  
}