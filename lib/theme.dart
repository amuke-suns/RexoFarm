import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

class RexoFarmAppTheme {
  static ThemeData light() {
    return ThemeData(
      fontFamily: 'QuickSand',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: kAppPrimaryColor,
        secondary: kAppSecondaryColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}