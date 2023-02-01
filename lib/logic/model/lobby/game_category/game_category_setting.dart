import 'package:flutter_play_chess/logic/model/lobby/game_category/category_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';

class CategoryGameSetting extends GameSetting<CategoryVariant> {
  CategoryGameSetting({required super.settingName, required super.variants, required super.selectedVariantIndexes});

  @override
  CategoryGameSetting copyWith({
    List<int>? selectedVariantIndexes,
  }) {
    return CategoryGameSetting(settingName: settingName, variants: variants, selectedVariantIndexes: selectedVariantIndexes ?? this.selectedVariantIndexes);
  }
}
