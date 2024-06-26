// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static const MaterialColor _primarySwatch = MaterialColor(
    0xFF0066B0,
    {
      50: Color(0xFF005c9e),
      100: Color(0xFF00528d),
      200: Color(0xFF00477b),
      300: Color(0xFF003d6a),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001f35),
      700: Color(0xFF001423),
      800: Color(0xFF000a12),
      900: Color(0xFF000000),
    },
  );

  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0066B0),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    primaryColor: const Color(0xFF0066B0), // # Primary color
    primaryColorLight: const Color(0xFF219FFF), // # Secondary color
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primarySwatch,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
