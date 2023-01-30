import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';

class OtherGameCategorySetting extends CategoryGameSetting {
  @override
  bool operator ==(Object other) => other is OtherGameCategorySetting;

  @override
  int get hashCode => runtimeType.hashCode;
}
