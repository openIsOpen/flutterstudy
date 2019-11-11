import 'package:flutter/material.dart';

void main () => runApp(MyApp(
  items: new List<String>.generate(1000, (i)=> "Item $i")
));

class MyApp extends StatelessWidget{

  final List<String> items;
  MyApp({Key key, @required this.items}):super(key:key);
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          body:new ListView.builder(
            itemCount:items.length,
            itemBuilder:(context,index){
              return new ListTile(
                title:new Text('${items[index]}'),
              );
            }
          )
        ),
      );
  }
}

/*
//list view
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp
    (
      title:'TestListView',
      home: new Scaffold
      (
        appBar:new AppBar(
          title: new Text('TestListView'),
        ),
        body: new Center(
          child: new Container(
            child: new ListView(
              children: <Widget>[
                /*new ListTile(
                  leading:new Icon(Icons.access_time),
                  title:new Text('access_time')
                ),
                new ListTile(
                  leading:new Icon(Icons.account_balance),
                  title:new Text('account_balance')
                ),
                new Text('HelloWorld')*/

               new Image.network(
                  'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'
                ),
                new Image.network(
                  'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'
                ),
                new Image.network(
                  'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'
                ),new Image.network(
                  'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  

}
*/


/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar:AppBar(title:Text('helloworld')),
        body: Center(
          child: Container(
            child: new Image.network
            (
              'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg',
              scale: 1.0,
              ),
            height: 400, 
            width: 400,
            color: Colors.green,
          ),
        )
      )
    );
  }
}

*/
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar:AppBar(title:Text('helloworld')),
        body: Center(child: Container(
          child:new Text
          (
            'Hello JSPang',
            style:TextStyle
            (
              fontSize: 33
            ),
          ),
          alignment:Alignment.center,
          width: 500,
          height: 400,
          //color: Colors.lightBlue,
          decoration: new BoxDecoration
          (
            gradient: const LinearGradient(
              colors: [Colors.green,Colors.blueAccent]
            ),
            border: Border.all(
              width: 5,
              color: Colors.purple
            )
          ),
        )/*Text('Hellowrold___this is content',
        textAlign: TextAlign.left,
        maxLines: 2,
          style: TextStyle(
    fontSize:25.0,
    color:Color.fromARGB(255, 255, 150, 150),
    decoration:TextDecoration.underline,
    decorationStyle:TextDecorationStyle.solid,
  ),
        )),*/
      ))
    );
  }
}
*/