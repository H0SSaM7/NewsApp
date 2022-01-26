import 'package:flutter/material.dart';

class ThemesHelper {
  static ThemeData lightTheme = ThemeData(
      hintColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        headline1: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrange,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.deepOrange),
        trackColor: MaterialStateProperty.all(Colors.grey),
      ));

  static ThemeData darkTheme = ThemeData(
      hintColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Color(0xffd7dddc),
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        headline1: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      scaffoldBackgroundColor: const Color(0xff22345d),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121e3b),
          elevation: 0.0,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff121e3b),
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Color(0xffbdbdbd),
      ),
      dividerColor: Colors.white);
}
