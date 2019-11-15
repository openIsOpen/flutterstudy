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
    animation = CurvedAnimation(curve:Curves.bounceIn,parent: controller);
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
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation: animation,);
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}