import 'package:flutter/material.dart';

class OutlinedButtonThemeSecondary
    extends ThemeExtension<OutlinedButtonThemeSecondary> {
  final OutlinedButtonThemeData? themeData;

  OutlinedButtonThemeSecondary({this.themeData});

  @override
  OutlinedButtonThemeSecondary copyWith({OutlinedButtonThemeData? themeData}) {
    return OutlinedButtonThemeSecondary(themeData: themeData ?? this.themeData);
  }

  @override
  OutlinedButtonThemeSecondary lerp(
      covariant ThemeExtension<OutlinedButtonThemeSecondary>? other, double t) {
    if (other is! OutlinedButtonThemeSecondary) {
      return this;
    }

    return OutlinedButtonThemeSecondary(
        themeData: OutlinedButtonThemeData.lerp(themeData, other.themeData, t));
  }
}
