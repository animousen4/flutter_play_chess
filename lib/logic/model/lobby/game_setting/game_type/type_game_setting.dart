import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class TypeGameSetting extends GameSetting {
  // or game type id
  final String name;

  TypeGameSetting({required this.name});
}