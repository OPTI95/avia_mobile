// app_theme.dart
import 'package:flutter/material.dart';

import '../core/styles/colors.dart';
import '../core/styles/text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: StaticColors.black,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(StaticTextStyles.buttonText1),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: StaticColors.blue,
            unselectedItemColor: StaticColors.grey_6,
            showUnselectedLabels: true));
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: StaticColors.black,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(StaticTextStyles.buttonText1),
        ),
      ),
    );
  }
}
