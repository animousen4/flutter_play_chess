import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandableCardThemeData extends ThemeExtension<ExpandableCardThemeData> {
  final MaterialStateProperty<BoxDecoration?>? headerDecoration;

  final MaterialStateProperty<BoxDecoration?>? decoration;

  final MaterialStateProperty<TextStyle?>? headerTextStyle;

  final MaterialStateProperty<TextStyle?>? contentTextStyle;

  final MaterialStateProperty<Color?>? iconColor;

  final ImageProvider? Function()? decorationImage;

  final BoxConstraints? collapsedConstraints;

  final EdgeInsets? contentPadding;

  final EdgeInsets? collapsedPadding;

  const ExpandableCardThemeData(
      {this.headerDecoration,
      this.decoration,
      this.decorationImage,
      this.headerTextStyle,
      this.collapsedConstraints,
      this.contentTextStyle,
      this.contentPadding,
      this.collapsedPadding,
      this.iconColor});

  @override
  ThemeExtension<ExpandableCardThemeData> copyWith({
    MaterialStateProperty<BoxDecoration?>? headerDecoration,
    MaterialStateProperty<BoxDecoration?>? decoration,
    MaterialStateProperty<TextStyle?>? headerTextStyle,
    MaterialStateProperty<TextStyle?>? contentTextStyle,
    MaterialStateProperty<Color?>? iconColor,
    BoxConstraints? collapsedConstraints,
    EdgeInsets? contentPadding,
    EdgeInsets? collapsedPadding,
    ImageProvider? Function()? decorationImage,
  }) {
    return ExpandableCardThemeData(
        headerDecoration: headerDecoration ?? this.headerDecoration,
        decoration: decoration ?? this.decoration,
        decorationImage: decorationImage ?? this.decorationImage,
        headerTextStyle: headerTextStyle ?? this.headerTextStyle,
        collapsedConstraints: collapsedConstraints ?? this.collapsedConstraints,
        contentTextStyle: contentTextStyle ?? this.contentTextStyle,
        collapsedPadding: collapsedPadding ?? this.collapsedPadding,
        contentPadding: contentPadding ?? this.contentPadding,
        iconColor: iconColor ?? this.iconColor);
  }

  ThemeExtension<ExpandableCardThemeData> merge(ExpandableCardThemeData? other) => other != null ? copyWith(
    headerDecoration: other.headerDecoration,
    decoration: other.decoration,
    headerTextStyle: other.headerTextStyle,
    contentTextStyle: other.contentTextStyle,
    iconColor: other.iconColor,
    collapsedConstraints: other.collapsedConstraints,
    collapsedPadding: other.collapsedPadding,
    contentPadding: other.contentPadding,
    decorationImage: other.decorationImage
  ) : this;

  @override
  ThemeExtension<ExpandableCardThemeData> lerp(
      covariant ThemeExtension<ExpandableCardThemeData>? other, double t) {
    // TODO: implement lerp

    if (other is! ExpandableCardThemeData) {
      return this;
    }

    return ExpandableCardThemeData(
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
