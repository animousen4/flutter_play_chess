// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/png/png_assets.dart';
import 'package:flutter_play_chess/view/theme/decorated_scaffold_theme.dart';
import 'package:flutter_play_chess/view/theme/dropdown_physical_button_theme.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';
import 'package:flutter_play_chess/view/theme/clock_widget_theme.dart';
import 'package:flutter_play_chess/view/theme/outlined_button_theme_secondary.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/theme/simple_expandable_card_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_play_chess/view/theme/play_button_theme.dart';

const backgroundColor = Color.fromARGB(255, 1, 14, 43);
const textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
  displayMedium: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
  displaySmall: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
  headlineMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
  headlineSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
  //headline6: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
  titleMedium:
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.7),

  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
);

class AppThemeManager {
  static ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      typography: Typography.material2021(colorScheme: ColorScheme.dark()),
      brightness: Brightness.dark,
      extensions: [
        DecoratedScaffoldTheme(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
              //Color.fromARGB(255, 1, 14, 43),
              //Color.fromARGB(255, 1, 14, 43),

              Color.fromRGBO(2, 15, 44, 1),
              Color.fromRGBO(2, 15, 44, 1),
              Color.fromRGBO(2, 15, 44, 1),
              Color.fromRGBO(2, 15, 44, 1),
              Color.fromRGBO(61, 71, 93, 1),
            ]))),
        DropdownPhysicalButtonTheme(
            backgroundColor: Colors.white, onBackground: Colors.black),
        ClockWidgetTheme(
            decoration: BoxDecoration(
              color: Color.fromRGBO(55, 65, 88, 1),
              borderRadius: BorderRadius.circular(7),
            ),
            decorationEnabled: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(7)),
            timeStyle: null,
            timeStyleEnabled: TextStyle(color: Color.fromRGBO(2, 15, 44, 1))),
        PlayButtonTheme(
            buttonStyle: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF5F37FF),
                  Color(0xFFA54BFF),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                borderRadius: BorderRadius.circular(10))),
        ExpandableCardThemeData(
            iconColor: MaterialStateProperty.all(Colors.grey),
            contentTextStyle:
                MaterialStateProperty.all(TextStyle(color: Colors.black)),
            collapsedPadding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 22, right: 22),
            contentPadding: EdgeInsets.zero,
            decorationImage: () =>
                Image.asset(PngAssets.gameModeBackground).image,
            decoration: MaterialStateProperty.resolveWith<BoxDecoration>(
                (states) => BoxDecoration(color: Colors.white)),
            headerDecoration:
                MaterialStateProperty.resolveWith<BoxDecoration>((states) {
              if (states.contains(MaterialState.disabled)) {
                return BoxDecoration(color: Colors.grey);
              }

              return BoxDecoration(
                  gradient: states.containsAll([MaterialState.selected])
                      ? LinearGradient(
                          colors: states.containsAll([MaterialState.pressed])
                              ? [
                                  Color.fromARGB(255, 126, 113, 182),
                                  Color.fromARGB(255, 35, 15, 119),
                                ]
                              : [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 35, 15, 119),
                                ])
                      : LinearGradient(colors: [
                          Color.fromARGB(255, 44, 35, 79),
                          Color.fromARGB(255, 9, 20, 49)
                        ]));
            }),
            headerTextStyle:
                MaterialStateProperty.resolveWith<TextStyle>((states) {
              return states.containsAll([MaterialState.selected])
                  ? states.containsAll([MaterialState.pressed])
                      ? TextStyle(color: Colors.white)
                      : TextStyle(color: Colors.black)
                  : TextStyle(color: Colors.blueGrey);
            })),
        SimpleExpandableCardTheme(
            expandableCardThemeData: ExpandableCardThemeData(
                decoration: MaterialStateProperty.resolveWith<BoxDecoration>(
                    (states) => BoxDecoration(color: Colors.white)),
                decorationImage: () => null,
                collapsedPadding:
                    const EdgeInsets.only(top: 14, left: 22, bottom: 14),
                //collapsedConstraints: const BoxConstraints(minHeight: 40),
                headerTextStyle: MaterialStateProperty.resolveWith((states) =>
                    TextStyle(
                        color: states.contains(MaterialState.selected)
                            ? Colors.black
                            : Colors.grey)),
                headerDecoration:
                    MaterialStateProperty.resolveWith((states) => BoxDecoration(
                          gradient: LinearGradient(
                              colors: !states.contains(MaterialState.selected)
                                  ? [
                                      Color.fromARGB(255, 44, 35, 79),
                                      Color.fromARGB(255, 9, 20, 49)
                                    ]
                                  : [Colors.white, Colors.white]),
                        )))),
        SelectionItemThemeData(
            decoration: MaterialStateProperty.resolveWith((states) {
              return BoxDecoration(
                  color: states.contains(MaterialState.disabled)
                      ? Colors.white.withOpacity(0.6)
                      : states.contains(MaterialState.selected)
                          ? Colors.white
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey));
            }),
            textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
                color: states.contains(MaterialState.disabled)
                    ? Colors.red
                    : states.contains(MaterialState.selected)
                        ? backgroundColor
                        : Colors.grey))),
        SelectionItemThemeSecondary(SelectionItemThemeData(
            decoration: MaterialStateProperty.resolveWith((states) {
              return BoxDecoration(
                  color: states.contains(MaterialState.disabled)
                      ? Color(0xFFDDD8DF)
                      : states.contains(MaterialState.selected)
                          ? Color(0xFFDDD8DF)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey));
            }),
            textStyle: MaterialStateProperty.resolveWith(
                (states) => TextStyle(color: Colors.black)))),
        OutlinedButtonThemeSecondary(
          themeData: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) =>
                  Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
              side: MaterialStateProperty.resolveWith((states) => BorderSide(
                  width: 1,
                  color: Colors.grey))))
        ),
      ],
      dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 14)),
      dividerTheme: DividerThemeData(thickness: 2),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(343, 50)),
        animationDuration: Duration(milliseconds: 100),
        backgroundColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.disabled)
                ? Colors.grey
                : Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        foregroundColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.disabled)
                ? Colors.white
                : Color.fromARGB(255, 1, 14, 43)),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              side: MaterialStateProperty.resolveWith((states) => BorderSide(
                  width: 1,
                  color: states.contains(MaterialState.disabled)
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white)))),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      // by default textBody2
      // headline6 for appBar title
      listTileTheme: ListTileThemeData(),
      toggleButtonsTheme: ToggleButtonsThemeData(
          disabledColor: Colors.white.withOpacity(0.3),
          selectedColor: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withOpacity(0.6)),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints(maxHeight: 48),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      //primaryTextTheme: const TextTheme(),
      appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 1, 11, 33)),
      navigationBarTheme: const NavigationBarThemeData(
          height: 48,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Color.fromARGB(255, 1, 11, 33),
          indicatorColor: Colors.transparent));
}
