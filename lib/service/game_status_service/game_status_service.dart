import 'package:flutter_play_chess/logic/_game/game_info.dart';
import 'package:flutter_play_chess/logic/model/game_status/game_status.dart';
import 'package:rxdart/subjects.dart';

interface class GameStatusService {
  final BehaviorSubject<GameStatus?> gameStatus = BehaviorSubject.seeded(null);

  Future<void> initGameService() async {
    // connect to server and get neccessary data
    await Future.delayed(Duration(milliseconds: 2700));
    gameStatus.add(PlayingGameStatus(-1));
  }

  GameStatusService();
}
