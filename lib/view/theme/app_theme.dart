import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/decorated_scaffold_theme/decorated_scaffold_theme.dart';
import 'package:flutter_play_chess/view/theme/dropdown_physical_button_theme/dropdown_physical_button_theme.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color.fromARGB(255, 1, 14, 43);
const textTheme = TextTheme(
  headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
  headline2: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
  headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
  headline4: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
  headline5: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
  //headline6: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
  subtitle1:
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.7),

  bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
);

class AppThemeManager {
  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      extensions: const [
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
            backgroundColor: Colors.white, onBackground: Colors.black)
      ],
      dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 14)),
      dividerTheme: DividerThemeData(thickness: 2),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
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
      listTileTheme: ListTileThemeData(
      ),
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
      appBarTheme:
          AppBarTheme(backgroundColor: Color.fromARGB(255, 1, 11, 33)),
      navigationBarTheme: const NavigationBarThemeData(
          height: 48,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Color.fromARGB(255, 1, 11, 33),
          indicatorColor: Colors.transparent));
}
