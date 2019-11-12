import 'package:flutter/material.dart';



class ButtonDemo extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Demo'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Raise button'),
            RaisedButton(
              color:Colors.lightBlue,
              child: Text('Raise button'),onPressed: (){},
            ),

            Text('Flat button'),
            FlatButton(
              color:Colors.lightBlue,
              child: Text('Flat button'),onPressed: (){},
            ),

            Text('Outline button'),
            OutlineButton(
              color:Colors.lightBlue,
              child: Text('Outline button'),onPressed: (){},
            ),

            Text('Icon button'),
            IconButton(
              color:Colors.lightBlue,
              icon:Icon( Icons.add),onPressed: (){},
            ),

            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )

          ],
        ),
      ),
    );
  }

}