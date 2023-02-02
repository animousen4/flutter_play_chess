import 'package:flutter_play_chess/logic/model/lobby/game_color/color_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class ColorGameSetting extends GameSetting<ColorVariant> {

  ColorGameSetting({required super.settingName, required super.variants, required super.selectedVariantIndexes});

  @override
  ColorGameSetting copyWith({List<int>? selectedVariantIndexes}) {
    
    return ColorGameSetting(settingName: settingName, variants: variants, selectedVariantIndexes: selectedVariantIndexes ?? this.selectedVariantIndexes);
  }
}
