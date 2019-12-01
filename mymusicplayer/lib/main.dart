import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mymusicplayer/databaseservice.dart';
import 'package:mymusicplayer/dataevent.dart';
import 'package:mymusicplayer/event.dart';
import 'package:mymusicplayer/getfileservice.dart';
import 'package:mymusicplayer/loadding.dart';
import 'package:mymusicplayer/musicmodule.dart';
//import 'package:flute_music_player/flute_music_player.dart';

AudioPlayer player = new AudioPlayer();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MusicModule> musics = new List<MusicModule>();
  Future<List<MusicModule>> _future;
  String _counter = '';

  @override
  void initState() {
    super.initState();
    GetFilesService getFilesService = GetFilesService();
    getFilesService.getMusicsFromDb().then((value) {
      setState(() {
        musics = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MusicPlay(_counter),
            MusicList(musics),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          musics = await GetFilesService.getMusics(fun: (str) {
            setState(() {
              _counter = str;
            });
          });
          _future = GetFilesService.getMusics();

          _future.then((value) async {
            var db = DbHelper();
            await db.init();
            await db.deleteAllMusic();
            for (var music in value) {
              await db.insertMusic(music);
            }
            print('OK');
            print(musics.length);
            setState(() {
              musics = value;
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MusicPlay extends StatefulWidget {
  String msg;
  MusicPlay(this.msg);
  @override
  State<StatefulWidget> createState() {
    return MusicPlayState();
  }
}

class MusicPlayState extends State<MusicPlay> {
  static int totalTime = 0;
  static int positionTime = 0;
  StreamSubscription _positionSubscription;
  bool playing = true;

  @override
  void initState() {
    super.initState();
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
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5),
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_left),
                    onPressed: () {},
                  )),
              Container(
                  margin: EdgeInsets.all(5),
                  child: FloatingActionButton(
                    child: Icon(playing? Icons.stop:Icons.play_arrow),
                    onPressed: () {
                      if (playing) {
                        player.pause();
                        playing =false;
                      } else {
                        player.resume();
                        playing  = true;
                      }
                      setState(() {
                        
                      });
                    },
                  )),
              Container(
                  margin: EdgeInsets.all(5),
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_right),
                    onPressed: () {},
                  )),
            ],
          ),
          Slider(
            onChanged: (double value) {},
            min: 0.0,
            activeColor: Colors.red,
            inactiveColor: Colors.white,
            max: totalTime.roundToDouble(),
            value: positionTime.roundToDouble(),
          )
        ],
      ), //Text('${widget.msg}'),
      height: 230,
    );
  }
}

class MusicList extends StatelessWidget {
  List<MusicModule> musics;
  MusicList(this.musics);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        color: Colors.blue[20],
        child: ListView.separated(
          //itemCount: 65,
          itemBuilder: (BuildContext context, int index) {
            if (musics.length == 0) {
              return Text('Please Wait');
            } else {
              return ListTile(
                leading: Icon(Icons.music_video),
                title: Text('${musics[index].name}'),
                subtitle: Text('${musics[index].path}'),
                trailing: Icon(Icons.play_arrow),
                onTap: () {
                  _playMusic(musics[index].path);
                },
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.blue,
              thickness: 0,
              height: 0,
            );
          },
          itemCount: musics.length,
        ));
  }

  _playMusic(String path) {
    int totalTime = 0;
    int curTime = 0;
    player.stop();
    player.play(path, isLocal: true);
    player.durationHandler = (time) {
      totalTime = time.inSeconds;
      LocalEventBus.bus
          .fire(PositionEvent(curPosition: curTime, totleTime: totalTime));
    }; //complete duration
    player.positionHandler = (time) {
      curTime = time.inSeconds;
      LocalEventBus.bus
          .fire(PositionEvent(curPosition: curTime, totleTime: totalTime));
    }; //positionHandler
    print(path);
  }
}
