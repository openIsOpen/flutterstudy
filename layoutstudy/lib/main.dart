import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  }

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layouttest',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout Text'),),
        body:new Stack(
          //alignment: const FractionalOffset(1, 1),
          children: <Widget>[

            new Positioned(
              top: 10,
              left: 10,
              child: Text('Text Look'),
              ),

            /*
            CircleAvatar(
              backgroundColor: Colors.limeAccent,
              radius: 200.0,
            ),
            */

            new Positioned(
              top: 100,
              left: 50,
              child: RaisedButton(
              child:Text('Button 2'),
              color: Colors.green,
              onPressed: (){},
            ),

            ),
            
            RaisedButton(
              child: Text('Button 3'),
              color: Colors.orange,
              onPressed: (){},
            )
          ],
        )
      ),
    );
  }
}

/*  
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layouttest',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout Text'),),
        body:new Stack(
          alignment: const FractionalOffset(1, 1),
          children: <Widget>[
            /*  
            CircleAvatar(
              backgroundColor: Colors.limeAccent,
              radius: 200.0,
            ),
            */

            Text('Text Look'),

            RaisedButton(
              child:Text('Button 2'),
              color: Colors.green,
              onPressed: (){},
            ),

            RaisedButton(
              child: Text('Button 3'),
              color: Colors.orange,
              onPressed: (){},
            )
          ],
        )
      ),
    );
  }
}
*/

 /* 
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layouttest',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout Text'),),
        body:new Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('1'),
            Text('12'),
            Text('1231231'),
            Text('1231231sfsfsf'),
            Text('1231231sadfasdfasdfasdf'),
          ],
        )
      ),
    );
  }
}
*/

  /*
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layouttest',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout Text'),),
        body:new Row(
          children: <Widget>[
            RaisedButton(
              child:Text('Button 1'),
              color: Colors.red,
              onPressed: (){},
            ),

            Expanded(child: RaisedButton(
              child:Text('Button 2'),
              color: Colors.green,
              onPressed: (){},
            )),

            RaisedButton(
              child: Text('Button 3'),
              color: Colors.orange,
              onPressed: (){},
            )
          ],
        )
      ),
    );
  }
}
 */

 /* 
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layouttest',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout Text'),),
        body:new Row(
          children: <Widget>[
            Expanded(child: RaisedButton(
              child:Text('Button 1'),
              color: Colors.red,
              onPressed: (){},
            )),

            Expanded(child: RaisedButton(
              child:Text('Button 2'),
              color: Colors.green,
              onPressed: (){},
            )),

            Expanded (child: RaisedButton(
              child: Text('Button 3'),
              color: Colors.orange,
              onPressed: (){},
            ))
          ],
        )
      ),
    );
  }
}

*/