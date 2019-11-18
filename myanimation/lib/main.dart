import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mystructure.dart';
import 'myswichanimationfromroute.dart';
import 'heropageb.dart';

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
      body:Column(children: <Widget>[
        RaisedButton(
          child: Text('Structure'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return ScaleAnimationRoute1();}));
          },
        ),
        RaisedButton(
          child: Text('CustomRouteTransition'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context){
              return SwichAnimationFromRoutePage();
            }));
          },
        ),
        RaisedButton(
          child: Text('CustomRouteTransition1'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (BuildContext context,Animation animation,
              Animation secondAnimation){
                return FadeTransition(
                  opacity: animation,
                  child: SwichAnimationFromRoutePage(),
                  );
              }
            ));
          },
        ),
        RaisedButton(
          child: Text('ComplexAnimation'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
          },
        ),
        RaisedButton(
          child: Text('SwitchAnimationComponent'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
          },
        ),
        RaisedButton(
          child: Text('AnimationRouteComponent'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
          },
        ),
        RaisedButton(
          child: Text('HeroAnimation'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HeroPageA();
            }));
          },
        )
      ],)
    );
  }

}

