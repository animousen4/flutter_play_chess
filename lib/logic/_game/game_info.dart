import 'package:flutter_play_chess/logic/_game/board_info.dart';

abstract class GameInfo {
  final List<BoardInfo> boards;

  GameInfo(this.boards);
}
