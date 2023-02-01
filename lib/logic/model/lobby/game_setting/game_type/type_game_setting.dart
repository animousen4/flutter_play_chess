import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_variant.dart';

class TypeGameSetting extends GameSetting<TypeVariant> {

  TypeGameSetting({required super.settingName, required super.variants, required super.selectedVariantIndexes});

  @override
  TypeGameSetting copyWith({
    List<int>? selectedVariantIndexes,
  }) {
    return TypeGameSetting(settingName: settingName, variants: variants, selectedVariantIndexes: selectedVariantIndexes ?? this.selectedVariantIndexes);
  }
}