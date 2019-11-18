import 'package:flutter/material.dart';

class MyStructurn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyStructureState();
  }

}

class MyStructureState extends State<MyStructurn> with SingleTickerProviderStateMixin{
  Animation<double> animation = null;
  AnimationController controller = null;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 3),vsync: this
    );
    //animation = CurvedAnimation(curve:Curves.bounceIn,parent: controller);
    animation = new Tween(
      begin: 0.0,
      end: 300.0
    ).animate(controller)
    ..addListener((){
      setState(()=>{});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Structure'),),
      body: Center(
        child:Image.asset('images/1.JPG',
        width: animation.value,
        height: animation.value,
        ),
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

}

class AnimatedImage extends AnimatedWidget{

  AnimatedImage({Key key,Animation<double> animation}):
    super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset('images/1.JPG',
      width:animation.value,
      height: animation.value,),
    );
  }

}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((listener){
      if (listener == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (listener == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画
    controller.forward();
  }
/*
  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation: animation,);
  }
*/

@override
Widget build(BuildContext context) {
  //return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/1.JPG"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
              height: animation.value, 
              width: animation.value, 
              child: child,
          ),
        );
      },
    );
}

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}