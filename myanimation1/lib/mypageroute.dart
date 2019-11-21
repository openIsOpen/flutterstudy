import 'package:flutter/material.dart';

class MyPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageRoute'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Page2'),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(context, _createRoute());
          },
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animationo, secondAnimation) {
        return Page2();
      },
      transitionsBuilder: (context, animation, secondAnimation, child) {
        Offset begin = Offset(0,1);
        Offset end = Offset.zero;
        var curve = Curves.ease;
        //var tween = Tween(begin: begin,end: end);
        var curveTween = CurveTween(curve:curve );
        var tween = Tween(begin: begin,end:end).chain(curveTween);    
        Animation<Offset> offsetAnimation = animation.drive(tween);

        /*
        CurvedAnimation curvedAnimation = CurvedAnimation(curve:curve,parent: animation);
        var position = tween.animate(curvedAnimation);*/
        return SlideTransition(
          
          position:offsetAnimation,
          //position:  position,
          child: child,
        );
      },
    );
  }
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: Center(
        child: Text('Page2'),
      ),
    );
  }
}
