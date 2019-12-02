import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dataevent.dart';
import 'event.dart';
import 'musicmodule.dart';

class MusicList extends StatelessWidget {
  List<MusicModule> musics;
  AudioPlayer player;
  MusicList(this.musics, this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        color: Colors.blue[20],
        child: Scrollbar(
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
          ),
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
