import 'package:flutter/material.dart';

class SelectionItemThemeData extends ThemeExtension<SelectionItemThemeData> {
  final MaterialStateProperty<BoxDecoration?>? decoration;
  final MaterialStateProperty<TextStyle?>? textStyle;

  SelectionItemThemeData({required this.decoration, required this.textStyle});

  @override
  ThemeExtension<SelectionItemThemeData> copyWith({
    MaterialStateProperty<BoxDecoration?>? decoration,
    MaterialStateProperty<TextStyle?>? textStyle,
  }) {
    return SelectionItemThemeData(
        decoration: decoration ?? this.decoration,
        textStyle: textStyle ?? this.textStyle);
  }

  ThemeExtension<SelectionItemThemeData> merge(SelectionItemThemeData? other) => other != null ?
      copyWith(decoration: other.decoration, textStyle: other.textStyle) : this;

  @override
  ThemeExtension<SelectionItemThemeData> lerp(
      covariant ThemeExtension<SelectionItemThemeData>? other, double t) {
    if (other is! SelectionItemThemeData) {
      return this;
    }

    return SelectionItemThemeData(
        decoration: MaterialStateProperty.lerp<BoxDecoration?>(
            decoration, other.decoration, t, BoxDecoration.lerp),
        textStyle: MaterialStateProperty.lerp<TextStyle?>(
            textStyle, other.textStyle, t, TextStyle.lerp));
  }
}

class SelectionItemThemeSecondary
    extends ThemeExtension<SelectionItemThemeSecondary> {
  final SelectionItemThemeData themeData;

  SelectionItemThemeSecondary(this.themeData);

  @override
  ThemeExtension<SelectionItemThemeSecondary> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<SelectionItemThemeSecondary> lerp(
      covariant ThemeExtension<SelectionItemThemeSecondary>? other, double t) {
    if (other is! SelectionItemThemeSecondary) {
      return this;
    }

    return SelectionItemThemeSecondary(
        themeData.lerp(other.themeData, t) as SelectionItemThemeData);
  }
}
