import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class ColorGameSetting extends GameSetting {
  final String color;
  ColorGameSetting({required this.color});

  @override
  int get hashCode => color.hashCode;
  
  @override
  bool operator ==(Object other) {
    return other is ColorGameSetting && hashCode == other.hashCode;
  }
}
