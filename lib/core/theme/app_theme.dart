import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData _getBaseTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return _getBaseTheme(Brightness.light);
  }

  static ThemeData get darkTheme {
    return _getBaseTheme(Brightness.dark);
  }
}
