import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';

class SimpleExpandableCardTheme
    extends ThemeExtension<SimpleExpandableCardTheme> {
  final ExpandableCardThemeData? expandableCardThemeData;

  SimpleExpandableCardTheme({this.expandableCardThemeData});

  @override
  ThemeExtension<SimpleExpandableCardTheme> copyWith({ExpandableCardThemeData? expandableCardThemeData}) {
    return SimpleExpandableCardTheme(
      expandableCardThemeData: expandableCardThemeData ?? this.expandableCardThemeData
    );
  }

  @override
  ThemeExtension<SimpleExpandableCardTheme> lerp(
      covariant ThemeExtension<SimpleExpandableCardTheme>? other, double t) {
    if (other is! SimpleExpandableCardTheme) {
      return this;
    }

    return SimpleExpandableCardTheme(
        expandableCardThemeData: other.expandableCardThemeData
            ?.lerp(expandableCardThemeData, t) as ExpandableCardThemeData);
  }
}
