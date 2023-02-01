import 'package:flutter_play_chess/logic/model/lobby/game_opponent/opponent_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class OpponentGameSetting extends GameSetting<OpponentVariant> {
  OpponentGameSetting({required super.settingName, required super.variants, required super.selectedVariantIndexes});
}
