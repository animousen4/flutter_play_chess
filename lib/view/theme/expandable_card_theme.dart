import 'package:flutter/material.dart';

class ExpandableCardTheme extends ThemeExtension<ExpandableCardTheme> {
  final MaterialStateProperty<BoxDecoration?>? headerDecoration;

  final MaterialStateProperty<BoxDecoration?>? decoration;

  final MaterialStateProperty<TextStyle?>? headerTextStyle;

  final MaterialStateProperty<TextStyle?>? contentTextStyle;

  final MaterialStateProperty<Color?>? iconColor;

  final ImageProvider? decorationImage;

  const ExpandableCardTheme(
      {this.headerDecoration,
      this.decoration,
      this.decorationImage,
      this.headerTextStyle,
      this.contentTextStyle,
      this.iconColor});

  @override
  ThemeExtension<ExpandableCardTheme> copyWith({
    MaterialStateProperty<BoxDecoration?>? headerDecoration,
    MaterialStateProperty<BoxDecoration?>? decoration,
    MaterialStateProperty<TextStyle?>? headerTextStyle,
    MaterialStateProperty<TextStyle?>? contentTextStyle,
    MaterialStateProperty<Color?>? iconColor,
    ImageProvider? decorationImage,
  }) {
    return ExpandableCardTheme(
        headerDecoration: headerDecoration ?? this.headerDecoration,
        decoration: decoration ?? this.decoration,
        decorationImage: decorationImage ?? this.decorationImage,
        headerTextStyle: headerTextStyle ?? this.headerTextStyle,
        contentTextStyle: contentTextStyle ?? this.contentTextStyle,
        iconColor: iconColor ?? this.iconColor);
  }

  @override
  ThemeExtension<ExpandableCardTheme> lerp(
      covariant ThemeExtension<ExpandableCardTheme>? other, double t) {
    // TODO: implement lerp

    if (other is! ExpandableCardTheme) {
      return this;
    }

    return ExpandableCardTheme(
        headerDecoration: MaterialStateProperty.lerp<BoxDecoration?>(
            headerDecoration, other.headerDecoration, t, BoxDecoration.lerp),
        decoration: MaterialStateProperty.lerp<BoxDecoration?>(
            decoration, other.decoration, t, BoxDecoration.lerp),
        decorationImage: other.decorationImage,
        headerTextStyle: MaterialStateProperty.lerp<TextStyle?>(
            headerTextStyle, other.headerTextStyle, t, TextStyle.lerp),
        contentTextStyle: MaterialStateProperty.lerp<TextStyle?>(
            contentTextStyle, other.contentTextStyle, t, TextStyle.lerp),
        iconColor: MaterialStateProperty.lerp<Color?>(
            iconColor, other.iconColor, t, Color.lerp));
  }
}
