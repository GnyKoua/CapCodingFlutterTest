import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    shadowColor: primaryColor.withOpacity(0.25),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightColor,
    canvasColor: canvasColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          background: lightColor,
        ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      toolbarHeight: 70,
      backgroundColor: primaryColor,
      foregroundColor: lightColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightColor,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: lightColor, size: 25),
      actionsIconTheme: IconThemeData(color: lightColor),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 18,
        color: darkColor,
      ),
      displayMedium: TextStyle(
        fontSize: 15,
        color: darkColor,
      ),
      displaySmall: TextStyle(
        fontSize: 15,
        color: darkColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 27,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 21,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: darkColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: darkColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: darkColor,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: textSecondaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: textSecondaryColor,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: textSecondaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5),
        ),
        elevation: 12.0,
        textStyle: const TextStyle(color: lightColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: lightColor,
        foregroundColor: primaryColor,
        side: const BorderSide(
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5),
        ),
        elevation: 0,
        textStyle: const TextStyle(color: primaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    shadowColor: darkPrimaryColor.withOpacity(0.25),
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkPageBackgroundColor,
    canvasColor: darkCanvasColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          brightness: Brightness.dark,
          secondary: darkSecondaryColor,
          background: darkBackgroundColor,
        ),
  );
}
