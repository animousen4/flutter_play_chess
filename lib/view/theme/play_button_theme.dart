import 'package:flutter/material.dart';

class PlayButtonTheme extends ThemeExtension<PlayButtonTheme>{

  final ButtonStyle? buttonStyle;
  final BoxDecoration? decoration;

  PlayButtonTheme({this.buttonStyle, this.decoration});
  @override
  ThemeExtension<PlayButtonTheme> copyWith({ButtonStyle? buttonStyle, BoxDecoration? decoration}) {
    return PlayButtonTheme(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      decoration: decoration ?? this.decoration
    );
  }

  @override
  ThemeExtension<PlayButtonTheme> lerp(covariant ThemeExtension<PlayButtonTheme>? other, double t) {
    // TODO: implement lerp
    if (other is! PlayButtonTheme) {
      return this;
    }

    return PlayButtonTheme(
      buttonStyle: ButtonStyle.lerp(buttonStyle, other.buttonStyle, t),
      decoration: BoxDecoration.lerp(decoration, other.decoration, t)
    );
  }
  
}