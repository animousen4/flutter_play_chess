import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';

class RegularGameCategorySetting extends CategoryGameSetting {

  @override
  bool operator ==(Object other) => other is RegularGameCategorySetting;

  @override
  int get hashCode => runtimeType.hashCode;
}
