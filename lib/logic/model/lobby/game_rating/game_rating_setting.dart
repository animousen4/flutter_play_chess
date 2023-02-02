import 'package:flutter_play_chess/logic/model/lobby/game_rating/rating_game_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class RatingGameSetting extends GameSetting<RatingVariant> {
  RatingGameSetting({required super.settingName, required super.variants, required super.selectedVariantIndexes});

  @override
  RatingGameSetting copyWith({List<int>? selectedVariantIndexes}) {
    
    return RatingGameSetting(settingName: settingName, variants: variants, selectedVariantIndexes: selectedVariantIndexes ?? this.selectedVariantIndexes);
  }
}