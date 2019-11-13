import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIGKLMNOPQRSTUVWSYZ';
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView'),),
      body: SingleChildScrollView(
        padding:EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: 
              str.split('')
                .map((c)=>Text(c,textScaleFactor: 2,))
                .toList()           
          ),
        ),
      ),
    );
  }
  
}