import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'statemanagent',
      theme: ThemeData(backgroundColor:Colors.blue),
      home:Home()
    );
  }
}



class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text( 'Home')),
      body:Center(
        child:Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.lightBlue,
              child: Text('Box1'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    //builder:(context){return new TabBox1Test();}
                    builder: (context)=>TabBox1()
                  )
                );
              },
            ),
             MaterialButton(
              color: Colors.lightBlue,
              child: Text('Box2'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ParentWidget()
              ));},
            ),
             MaterialButton(
              color: Colors.lightBlue,
              child: Text('Box3'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(
                builder: (context)=>TapboxC()
              ));},
            )
          ],
        ),
      ) ,
    );
  }

}

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title:Text('Test'),),
      body: Center(
        child: Text('Test'),
      ),
    );
  }

}

class TabBox1Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBox1TestState();
  }
}
class _TabBox1TestState extends State<TabBox1Test>{
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar(title: Text('TabBox1Test'),),
      body: TabBox1(),
    );
  }

}

class TabBox1 extends StatefulWidget{
  TabBox1({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBox1State();
  }
}
class _TabBox1State extends State<TabBox1>{
  bool _active = false;

  void _handleTap(){
    print('------------tab----------------');
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active?'active':'inactive',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        
        height: 200,
        width: 200,
        
        decoration: BoxDecoration(
          color:_active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }
}


class TabBox10 extends StatefulWidget{
  TabBox10({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBox10State();
  }
}
class _TabBox10State extends State<TabBox10>{
  bool _active = false;

  _handleTap(){
    print('tab');
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: MaterialButton(
      onPressed   : _handleTap(),
      child: new Container(
        child: new Center(
          child: new Text(
            _active?'active':'inactive',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        
        height: 100,
        width: 100,
        
        decoration: BoxDecoration(
          color:_active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
      ),
      
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print('_handleTapDown');
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮  
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}