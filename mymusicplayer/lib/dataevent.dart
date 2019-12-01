
class PositionEvent{
  PositionEvent({this.curPosition,this.totleTime});
  int totleTime;
  int curPosition;
}

class PlayEvent{
  PlayEvent({this.playing});
  bool playing;
}