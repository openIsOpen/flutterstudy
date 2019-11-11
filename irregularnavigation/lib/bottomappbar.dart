import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'eachview.dart';

class BottomAppBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomAppBarState();
  }

}

class _BottomAppBarState extends State<BottomAppBar>{
  List<Widget> _eachView ;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = new List();
    _eachView
     ..add(new EachView('Home'))
     ..add(new EachView('Me'));
    
  }

  @override
  Widget build(BuildContext context) {
 
        return new Scaffold(
          body: _eachView[_index],
          floatingActionButton:FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
                return EachView('New Page');
              }));
            },
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              color:Colors.white
            ),
            
          ),
    
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          
          bottomNavigationBar:prefix0. BottomAppBar(
            color: Colors.blue,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon:Icon( Icons.home),
                  color: Colors.white,
                  onPressed: (){
                    setState(() {
                      _index =0;
                    });
                  },
                ),

                IconButton(
                  icon:Icon( Icons.airport_shuttle),
                  color: Colors.white,
                  onPressed: (){
                    setState(() {
                      _index = 1;
                    });
                  },
                ),

              ],
            ),
          )
    );
  }

}

