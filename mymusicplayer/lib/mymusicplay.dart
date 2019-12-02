import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dataevent.dart';
import 'event.dart';

class MusicPlay extends StatefulWidget {
  AudioPlayer player;
  String msg;
  MusicPlay(this.msg, this.player);
  @override
  State<StatefulWidget> createState() {
    return MusicPlayState();
  }
}

class MusicPlayState extends State<MusicPlay> with TickerProviderStateMixin {
  static int totalTime = 0;
  static int positionTime = 0;
  StreamSubscription _positionSubscription;
  bool playing = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 5));
    _controller.addListener((){
      if(_controller.isCompleted)
      {
        _controller.reset();
        _controller.forward();
      }
    });
    _controller.forward();
    _positionSubscription =
        LocalEventBus.bus.on<PositionEvent>().listen((onData) {
      if (totalTime != onData.totleTime || positionTime != onData.curPosition) {
        setState(() {
          totalTime = onData.totleTime;
          positionTime = onData.curPosition;
          print('total:$totalTime,current:$positionTime');
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _positionSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      color: Colors.blue[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_getMusicIcon(_controller), _getProcess(), _getActionButton()],
      ), //Text('${widget.msg}'),
      height: 230,
    );
  }

  Widget _getMusicIcon(AnimationController controller) {
    return Center(
        child: SizedBox(
          height: 110,
          width: 110,
          child: RotationTransition(
            turns: controller,
            child: Image.asset('images/Music-icon.png'),
          ),
    ));
  }

  Widget _getProcess() {
    return Slider(
      onChanged: (double value) {},
      min: 0.0,
      activeColor: Colors.blue,
      inactiveColor: Colors.white,
      max: totalTime.roundToDouble(),
      value: positionTime.roundToDouble(),
    );
  }

  Widget _getActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_left,size: 30,),
              onPressed: () {},
            )),
        Container(
            margin: EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Icon(playing ? Icons.stop : Icons.play_arrow,size: 35,),
              onPressed: () {
                if (playing) {
                  widget.player.pause();
                  playing = false;
                } else {
                  widget.player.resume();
                  playing = true;
                }
                setState(() {});
              },
            )),
        Container(
            margin: EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_right,size: 30,),
              onPressed: () {},
            )),
      ],
    );
  }
}
