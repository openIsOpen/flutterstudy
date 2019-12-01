import 'package:flutter/cupertino.dart';

class MusicModule {
  int id;
  String name = '';
  String path = '';
  String author = '';
  String createDate = '' ;
  String artical = '';
  String description = '';

  MusicModule(
      {@required this.name,
      @required this.path,
      this.id,
      this.author,
      this.createDate,
      this.artical,
      this.description});
}
