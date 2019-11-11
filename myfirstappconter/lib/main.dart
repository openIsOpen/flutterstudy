import 'package:flutter/material.dart';

/*
建议最好统一使用命名路由的管理方式
*/ 
Map<String,WidgetBuilder> _routers = new Map();

void main(){
  _routers['/'] = (context)=>new Home();
  _routers['home'] = (context)=>new Home();
  _routers['secondPage'] =(context) => new NewRouterPage();
  _routers['showdatapage'] = (context) => new ShowDataPage('para1');
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:(setting){
        return MaterialPageRoute(builder: (context){
          return Home();
        });
      } ,
      routes: _routers,
      initialRoute: '/',
      title: 'MyFirstApp',
      theme: ThemeData(backgroundColor: Colors.blue),
      //home: Home(),
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
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:/*(context){
                       return new NewRouterPage();
                    }*/
                    (countext)=>new NewRouterPage()
                  )
                );*/
                Navigator.pushNamed(context, 'secondPage');
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
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              child: Text('返回'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

            MaterialButton(
              color: Colors.lightBlue,
              child: Text('打开传参界面'),
              onPressed: () async{
                /*
                var result = await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>
                    new ShowDataPage('Hello Show Data Page')
                  )
                );

                print('返回值:$result');*/
                var result = await Navigator.pushNamed(context, 'showdatapage',arguments:'HI');
                print('返回值:$result');
              },
              
            )
          ],
        )

      ),
    );
  }
}

class ShowDataPage extends StatefulWidget{
  String para1 ;
  ShowDataPage(this. para1);
  @override
  State<StatefulWidget> createState() {
    return new ShowDataPageState();
  }
}

class ShowDataPageState extends State<ShowDataPage>{
  @override
  Widget build(BuildContext context) {
    var para1 = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Show Data Page'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('The passed para is $para1'),
            MaterialButton(
              child:Text('返回'),
              color: Colors.lightBlue,
              onPressed: (){
                Navigator.pop(context,'Show Data Paga returned'); 
              },
            )
          ],
        ),
      ),
    );
  }
}