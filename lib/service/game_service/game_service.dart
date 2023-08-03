import 'package:flutter_play_chess/logic/_game/game_info.dart';
import 'package:rxdart/subjects.dart';

class GameService {
  final BehaviorSubject<GameInfo?> game;

  GameService({required this.game});
}
