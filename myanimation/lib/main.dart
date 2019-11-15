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
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
          },
        ),
        RaisedButton(
          child: Text('CustomRouteTransition'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
          },
        ),
        RaisedButton(
          child: Text('HeroAnimation'),
          color:Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){}));
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
        )
      ],)
    );
  }

}

