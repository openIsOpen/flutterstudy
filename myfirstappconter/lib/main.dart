import 'package:flutter/material.dart';

void main(){
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFirstApp',
      theme: ThemeData(backgroundColor: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyFirstAppHome'),),
      body: Center(
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('count:'),
            Text('$counter'),
            FlatButton(
              child: Text('Open a new page'), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:/*(context){
                       return new NewRouterPage();
                    }*/
                    (countext)=>new NewRouterPage()
                  )
                );
              },

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter ++;
          });
        },
        child: Icon(Icons.add),
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
    );
  }
}

class NewRouterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('new Page')),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          child: Text('返回'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}