import 'package:flutter/material.dart';

class ClockWidgetTheme extends ThemeExtension<ClockWidgetTheme> {
  final TextStyle? timeStyle;
  final TextStyle? timeStyleEnabled;
  final Duration duration;
  final BoxDecoration? decorationEnabled;
  final BoxDecoration? decoration;

  const ClockWidgetTheme(
      {this.decoration, this.decorationEnabled, this.timeStyle, this.timeStyleEnabled, this.duration = const Duration(milliseconds: 200)});

  @override
  ThemeExtension<ClockWidgetTheme> copyWith(
      {BoxDecoration? decoration,
      BoxDecoration? decorationEnabled,
      Duration? duration,
      TextStyle? timeStyle,
      TextStyle? timeStyleEnabled}) {
    return ClockWidgetTheme(
        decoration: decoration ?? this.decoration,
        decorationEnabled: decorationEnabled ?? this.decorationEnabled,
        duration: duration ?? this.duration,
        timeStyle: timeStyle ?? this.timeStyle,
        timeStyleEnabled: timeStyleEnabled ?? this.timeStyleEnabled);
  }

  @override
  ThemeExtension<ClockWidgetTheme> lerp(
      covariant ThemeExtension<ClockWidgetTheme>? other, double t) {
    if (other is! ClockWidgetTheme) {
      return this;
    }

    return ClockWidgetTheme(
        decoration: BoxDecoration.lerp(decoration, other.decoration, t),
        decorationEnabled:
            BoxDecoration.lerp(decorationEnabled, other.decorationEnabled, t),
        duration: other.duration,
        timeStyle: TextStyle.lerp(timeStyle, other.timeStyle, t),
        timeStyleEnabled: TextStyle.lerp(timeStyleEnabled, other.timeStyleEnabled, t));
  }
}
