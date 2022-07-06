import 'package:flutter/material.dart';

class DecoratedScaffoldTheme extends ThemeExtension<DecoratedScaffoldTheme> {
  final Decoration? decoration;

  const DecoratedScaffoldTheme(
      {Key? key, required this.decoration, })
      : super();



  // static DecoratedScaffoldThemeData of(BuildContext context) {
  //   final DecoratedScaffoldTheme? decoratedScaffoldTheme = context.dependOnInheritedWidgetOfExactType<DecoratedScaffoldTheme>();
  //   return decoratedScaffoldTheme?.data ?? Theme.of(context).;
  // }

  @override
  ThemeExtension<DecoratedScaffoldTheme> copyWith({Decoration? data}) {
    return DecoratedScaffoldTheme(decoration: data ?? this.decoration);
  }
  
  @override
  ThemeExtension<DecoratedScaffoldTheme> lerp(ThemeExtension<DecoratedScaffoldTheme>? other, double t) {
    if (other is! DecoratedScaffoldTheme) {
      return this;
    }
    return DecoratedScaffoldTheme(
      decoration: Decoration.lerp(decoration, other.decoration, t)
    );
  }
}

class DecoratedScaffoldThemeData {}
