import 'package:mymusicplayer/musicmodule.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  Database _db ;
  Future<void> init() async {
      String sqlCmd = 'create table tb_music(id integer primary key,name text,path text,author text,createDate text,artical text,description text)';
    _db = await openDatabase(join(
      await getDatabasesPath(),'db_music'),
      onCreate:(db,version){
        print('database:$db created , version:$version');
        db.execute(sqlCmd);
      },
      version: 1
    );
  }

  Future<void> insertMusic(MusicModule music){
    String sqlCmd = 'insert into tb_music values(${music.id},\'${music.name}\',\'${music.path}\',\'${music.author}\',\'${music.createDate}\',\'${music.artical}\',\'${music.description}\')';
    return  _db.execute(sqlCmd);
  }

  Future<void> deleteAllMusic(){
    String sqlCmd = 'delete from tb_music';
    return _db.execute(sqlCmd);
  }

  Future<List<MusicModule>> getAllMusic() async {
    List<Map<String,dynamic>> musics = await _db.query('tb_music');
    return List.generate(musics.length, (i){
      return MusicModule(
        id:musics[i]['id'],
        name: musics[i]['name'],
        path:musics[i]['path'],
        author:musics[i]['author'],
        createDate: musics[i]['createDate'],
        artical:musics[i]['artical'],
        description: musics[i]['description']
      );
    });
  }

}