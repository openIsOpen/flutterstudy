import 'package:flutter/material.dart';
import 'customroute.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('FirstPage',style: TextStyle(fontSize: 36),),
        elevation: 0.0,
      ),
      body:Center(
        child:MaterialButton(
          child:Icon(
            Icons.navigate_next,
            color:Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.push((context),CustomRoute(
              SecondPage()
            ));
            /*
            Navigator.of(context).push(
              MaterialPageRoute(builder:(BuildContext contenxt){
                return SecondPage();
              })
            );*/
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage',style: TextStyle(fontSize: 36),),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0,
      ),
      body: Center(
        child: MaterialButton(
          child:Icon(
            Icons.navigate_before,
            color:Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

}