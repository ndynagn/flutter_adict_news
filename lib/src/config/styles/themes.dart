import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/config/styles/extensions/extensions.dart';
import 'package:flutter_adict_news/src/config/styles/styles.dart';

abstract class AppThemes {
  const AppThemes._();

  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    extensions: const [
      ThemeColors.light(),
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.cultured,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(.4),
      backgroundColor: AppColors.cultured,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumSmall,
          cornerSmoothing: 1,
        ),
        borderSide: const BorderSide(
          color: AppColors.raisinBlack,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumSmall,
          cornerSmoothing: 1,
        ),
        borderSide: BorderSide(
          color: AppColors.raisinBlack.withOpacity(.4),
        ),
      ),
      prefixIconColor: Colors.black.withOpacity(.4),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.chineseBlack,
    extensions: const [
      ThemeColors.dark(),
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.raisinBlack,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.4),
      backgroundColor: AppColors.raisinBlack,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumSmall,
          cornerSmoothing: 1,
        ),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumSmall,
          cornerSmoothing: 1,
        ),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.4),
        ),
      ),
      prefixIconColor: Colors.white.withOpacity(.4),
    ),
  );
}
