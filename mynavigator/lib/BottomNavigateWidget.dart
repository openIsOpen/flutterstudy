import 'package:flutter/material.dart';
import 'Home_Screen.dart';

class BottomNavigateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _BottomNavigateWidgetState();
  }

}

class _BottomNavigateWidgetState extends State<BottomNavigateWidget>{
  final _BottomNavigateColor = Colors.blue;
  List<Widget> list = new List();
  int _CurrentIndex = 0;

  @override
  void initState() {
    list
     ..add(Home_Screen())
     ..add(Email_Screen())
     ..add(Page_Screen())
     ..add(AirPlay_Screen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:list[_CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:_BottomNavigateColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _BottomNavigateColor),
            ),
            
          ),

            BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color:_BottomNavigateColor,
            ),
            title: Text(
              'Email',
              style: TextStyle(color: _BottomNavigateColor),
            )
          ),

            BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color:_BottomNavigateColor,
            ),
            title: Text(
              'Page',
              style: TextStyle(color: _BottomNavigateColor),
            )
          ),

            BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color:_BottomNavigateColor,
            ),
            title: Text(
              'AipPlay',
              style: TextStyle(color: _BottomNavigateColor),
            )
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _CurrentIndex,
        onTap: (int index){
          setState(() {
            _CurrentIndex = index;
            print(_CurrentIndex);
          });
        },
      ),
    );
  }

}