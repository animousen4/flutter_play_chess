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
  ThemeExtension<DropdownPhysicalButtonTheme> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<DropdownPhysicalButtonTheme> lerp(
      ThemeExtension<DropdownPhysicalButtonTheme>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
