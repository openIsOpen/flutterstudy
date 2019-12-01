import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mymusicplayer/getfileservice.dart';
import 'package:mymusicplayer/musicmodule.dart';
//import 'package:flute_music_player/flute_music_player.dart';


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
          //print('end, count:${musics.length}');
          //setState(() {});
          _future = GetFilesService.getMusics();
          
          _future.then((value) {
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



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      color: Colors.blue,
      child: Text('${widget.msg}'),
      height: 230,
    );
  }

}

class MusicList extends StatelessWidget {
  List<MusicModule> musics;
  MusicPlay player;
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
                leading: Icon(Icons.desktop_mac),
                title: Text('title'),
                subtitle: Text('${musics[index].name}'),
                trailing: Icon(Icons.play_arrow),
                onTap:(){
                  _playMusic(musics[index].path);
                } ,
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
          itemCount: 65535,
        ));
  }

  _playMusic(String path)
  {
    //MusicFinder().play(path);
    AudioPlayer player = new AudioPlayer();
    player.play(path,isLocal: true);
    print(path);
  }

}
