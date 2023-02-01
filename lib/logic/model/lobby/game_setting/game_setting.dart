class GameSetting<T> {
  final String settingName;
  late final Type type;
  final List<T> variants;
  final List<int> selectedVariantIndexes;

  final bool isRadio;
  void makeDefaults() {
    if (variants.isNotEmpty) {
      selectedVariantIndexes.add(0);
    }
  }

  GameSetting<T> copyWith({
    List<int>? selectedVariantIndexes,
  }) {
    return GameSetting<T>(settingName: settingName, variants: variants, selectedVariantIndexes: selectedVariantIndexes ?? this.selectedVariantIndexes);
  }

  GameSetting modifyGameSetting(
    int variantIndex,
    T newVariant,
  ) {
    GameSetting<T> modded = copyWith();

    modded.variants[variantIndex] = newVariant;

    return modded;
  }

  GameSetting({required this.settingName, required this.variants, required this.selectedVariantIndexes, this.isRadio = true}) {
    type = T;
  }
}