import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';

class TimeTypeGameSetting extends TypeGameSetting {
  final Duration timePerSide;
  TimeTypeGameSetting({required this.timePerSide, required super.name} );
}