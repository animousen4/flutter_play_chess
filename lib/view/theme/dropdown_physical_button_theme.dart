import 'package:flutter/material.dart';

class DropdownPhysicalButtonTheme
    extends ThemeExtension<DropdownPhysicalButtonTheme> {
  final Color? dividerColor;
  final Color? backgroundColor;
  final Color? onBackground;
  final BorderRadiusGeometry? borderRadius;

  const DropdownPhysicalButtonTheme(
      {this.dividerColor,
      this.backgroundColor,
      this.onBackground,
      this.borderRadius});

  @override
  ThemeExtension<DropdownPhysicalButtonTheme> copyWith({
      Color? dividerColor,
      Color? backgroundColor,
      Color? onBackground,
      BorderRadiusGeometry? borderRadius,
    }) {
    return DropdownPhysicalButtonTheme(
      dividerColor: dividerColor ?? this.dividerColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onBackground: onBackground ?? this.onBackground,
      borderRadius: borderRadius ?? this.borderRadius
    );
  }

  @override
  ThemeExtension<DropdownPhysicalButtonTheme> lerp(
      ThemeExtension<DropdownPhysicalButtonTheme>? other, double t) {
    // TODO: implement lerp
    if (other is! DropdownPhysicalButtonTheme) {
      return this;
    }

    return DropdownPhysicalButtonTheme(
        dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
        onBackground: Color.lerp(onBackground, other.onBackground, t),
        borderRadius:
            BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t));
  }
}
