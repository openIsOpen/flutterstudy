import 'package:mymusicplayer/musicmodule.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:mymusicplayer/utils.dart';
import 'package:path/path.dart' as PkgPath;

class GetFilesService {
  static Future<List<MusicModule>> getMusics({Function(String) fun}) async {
    List<MusicModule> musics = List<MusicModule>();
    await Utils.getPermission();
    var dir = await getExternalStorageDirectory();
    await getFiles(path: dir.path, musics: musics, fun: fun);

    return musics;
  }

  static getFiles(
      {String path, List<MusicModule> musics, Function(String) fun}) async {
    try {
      Directory dir = Directory(path);
      var files = dir.list();
      for (var f in await files.toList()) {
        //print(f.path);
        if (fun != null) {
          fun(f.path);
        }
        if (!FileSystemEntity.isFileSync(f.path)) {
          //directory
          await getFiles(path: f.path, musics: musics, fun: fun);
        } else {
          //file
          var name = PkgPath.basename(f.path);
          if (name.toLowerCase().endsWith('.mp3') ||
              name.toLowerCase().endsWith('.wav') ||
              name.toLowerCase().endsWith('.acc')) {
            musics.add(MusicModule(name: name, path: f.path));
          }
        }
      }
      /*
      await files.forEach((f) async  {
        print(f.path);
        if(fun != null){
          fun(f.path);
        }
        if (!FileSystemEntity.isFileSync(f.path)) {
          //directory
          await getFiles(path: f.path,musics: musics,fun:fun);
        } else {
          //file
          var name = PkgPath.basename(f.path);
          if (name.toLowerCase().endsWith('.mp3') ||
              name.toLowerCase().endsWith('.wav') ||
              name.toLowerCase().endsWith('.acc')) {
            musics.add(MusicModule(name: name, path: f.path));
          }
        }
      });*/
    } catch (e) {}
  }
}
