import 'dart:math';

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
      home:  Login(),
    );
  }
}

class Login extends StatelessWidget{
  var passWord = new TextEditingController();

  var userName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[       
            Text(''),
            Text(''),
            TextField(
              controller: userName,
              obscureText: false,
              decoration:InputDecoration(
                hintText:'用户名'
              )
            ),
            Text(''),
            
            TextField(
              controller:passWord,  
              obscureText: true,
              decoration:InputDecoration(
                hintText:'密码',
                labelText: 'password'
                
              )
            ),
            Text('user:${userName.text},password:${passWord.text}'),
            RaisedButton(
              child:Text('登录'),
              onPressed:(){print('username: ${userName.text},${passWord.text}');},
              padding: EdgeInsets.all(0),
            )
          ],)
        ),
      ),
    );
  }

}
