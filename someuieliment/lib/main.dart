import 'package:flutter/material.dart';
import 'buttondemo.dart';
import 'imageandicon.dart';
import 'swichandcheck.dart';
import 'inputandform.dart';
import 'progressindicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body:Center(
        child:Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.lightBlue,
              child:Text('Button Demo'),
              onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context)=>ButtonDemo())
                );
              },
            ),

            MaterialButton(
              color: Colors.lightBlue,
              child:Text('Images Icons Demo'),
              onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context)=>ImageAndIcon())
                );
              },
            ),

            MaterialButton(
              color: Colors.lightBlue,
              child: Text('单元框和复选框'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=>SwichAndCheck()
                  )
                );
              },
            ),

            MaterialButton(
              color: Colors.lightBlue,
              child:Text('输入和表单'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Login()
                ));
              },
            ) ,

            MaterialButton(
              color:Colors.lightBlue,
              child: Text('进度指示器'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>MyProgressIndicator()
                  )
                );
              },
            ) 

          ],
        ),
      ),
    );
  }
}


