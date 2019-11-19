

import 'package:flutter/material.dart';

class StaggerAnimation extends StatefulWidget{
  StaggerAnimation({Key key,this.controller}):super(key:key){

    height = Tween<double>(
      begin:.0,
      end: 100.0
    ).animate(
      CurvedAnimation(parent: controller,
      curve: Interval(
        0.0,0.6,curve: Curves.ease
      ))
    );

    padding = Tween<EdgeInsets>(
      begin:EdgeInsets.only(left:0),
      end: EdgeInsets.only(left: 100)
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve:Interval(
          0.6,1,curve: Curves.ease
        )
      )
    );

    color = Tween<Color>(
      begin: Colors.green,
      end:Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,0.6,
          curve: Curves.ease
        )
      )
    );

  }
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  @override
  _StaggerAnimationState createState() => _StaggerAnimationState();
}

class _StaggerAnimationState extends State<StaggerAnimation> {
  Widget _buildAnimation(BuildContext context,Widget child)
  {
    return Container(
      alignment: Alignment.center,
      padding: widget.padding.value,
      child: Container(
        color:widget.color.value,
        width: 50,
        height: widget.height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}

class StaggerRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StaggerRouteState();
  }
}
class StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 2)
    );
  }

  Future<Null> _playAnimation() async{
    try{
        await _controller.forward().orCancel;

        await _controller.reverse().orCancel;
    }on TickerCanceled {

    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
         _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color:Colors.grey.withOpacity(0.1),
            border: Border.all(
              color:Colors.white.withOpacity(0.5)
            )
          ),
          child:StaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
  
}