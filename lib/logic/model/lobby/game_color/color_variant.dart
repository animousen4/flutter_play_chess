enum GColor {white, black, random}
class ColorVariant {
  final GColor color;

  String get colorName => "gameSetting.color.${color.name}";

  ColorVariant(this.color);
}