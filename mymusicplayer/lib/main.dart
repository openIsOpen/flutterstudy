import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mymusicplayer/databaseservice.dart';
import 'package:mymusicplayer/getfileservice.dart';
import 'package:mymusicplayer/musicmodule.dart';
import 'package:path/path.dart' as prefix0;

import 'mymusiclist.dart';
import 'mymusicplay.dart';
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
      home: MyHomePage(title: 'BBMusicPlayer'),
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
      /*
      appBar: AppBar(
        title: Text(widget.title),
      ),
      */
      body: Center(
          child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MusicPlay(_counter, player),
            MusicList(musics, player),
          ],
        ),
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('alert dialog');
          /*
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("您确定要删除当前文件吗?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () => Navigator.of(context).pop(), //关闭对话框
                    ),
                    FlatButton(
                      child: Text("删除"),
                      onPressed: () {
                        // ... 执行删除操作
                        Navigator.of(context).pop(true); //关闭对话框
                      },
                    ),
                  ],
                );
              });
*/
          print('alart dialog end');
          _addMusicButtonHandler();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //~ This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addMusicButtonHandler() async {
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
  }
}
