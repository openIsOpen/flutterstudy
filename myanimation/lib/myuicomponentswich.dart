import 'package:flutter/material.dart';

class AnimatedSwicherCounterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwicherCounterRouteState();
  }
}

class _AnimatedSwicherCounterRouteState
    extends State<AnimatedSwicherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.display4,
            ),
          ),
          RaisedButton(
            child: Text('+1'),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          )
        ],
      ),
    ));
  }
}
