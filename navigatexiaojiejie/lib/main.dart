import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'navigatexiaoijejie',
  home: FirstPage(),
));

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('找小姐姐要电话'),),
      body:Center(
        child: RouteButton(),
      ),
    );
  }

}

//navigate button
class RouteButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child:Text('去找小姐姐'),
      onPressed:(){
        _navigateToXiaoJieJie(context);
      },
    );
  }

  _navigateToXiaoJieJie(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>XiaoJieJie()
      )
      );

      Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result'),));
  }

}

class XiaoJieJie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('我是小姐姐'),),
      body:Center(
        child:Column(
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed:(){
                Navigator.pop(context,'大长腿:1511008888');
              },
            ),
            RaisedButton(
              child:Text('小蛮腰小姐姐'),
              onPressed:(){
                Navigator.pop(context,'小蛮腰:12345678900s');
              },
            )
          ],
        ),
      )
    );
  }
  
}