import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/config/styles/styles.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors._({
    required this.primaryColor,
    required this.backgroundPrimaryColor,
    required this.backgroundSecondaryColor,
    required this.backgroundTertiaryColor,
    required this.smallChevronBackgroundColor,
    required this.accentColor,
  });

  const ThemeColors.light()
      : primaryColor = Colors.black,
        backgroundPrimaryColor = Colors.white,
        backgroundSecondaryColor = AppColors.cultured,
        backgroundTertiaryColor = Colors.white,
        smallChevronBackgroundColor = Colors.white,
        accentColor = AppColors.raisinBlack;

  const ThemeColors.dark()
      : primaryColor = Colors.white,
        backgroundPrimaryColor = AppColors.chineseBlack,
        backgroundSecondaryColor = AppColors.raisinBlack,
        backgroundTertiaryColor = AppColors.darkCharcoal,
        smallChevronBackgroundColor = Colors.white,
        accentColor = Colors.white;

  static ThemeColors of(BuildContext context) =>
      Theme.of(context).extension<ThemeColors>()!;

  final Color primaryColor;
  final Color backgroundPrimaryColor;
  final Color backgroundSecondaryColor;
  final Color backgroundTertiaryColor;
  final Color smallChevronBackgroundColor;
  final Color accentColor;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primaryColor,
    Color? primaryTextColor,
    Color? backgroundPrimaryColor,
    Color? backgroundSecondaryColor,
    Color? backgroundTertiaryColor,
    Color? smallChevronBackgroundColor,
    Color? accentColor,
    Color? buttonTitleColor,
    Color? ratingColor,
    Color? dangerButtonColor,
  }) {
    return ThemeColors._(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundPrimaryColor:
          backgroundPrimaryColor ?? this.backgroundPrimaryColor,
      backgroundSecondaryColor:
          backgroundSecondaryColor ?? this.backgroundSecondaryColor,
      backgroundTertiaryColor:
          backgroundTertiaryColor ?? this.backgroundTertiaryColor,
      smallChevronBackgroundColor:
          smallChevronBackgroundColor ?? this.smallChevronBackgroundColor,
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    covariant ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors._(
      primaryColor: Color.lerp(
        primaryColor,
        other.primaryColor,
        t,
      )!,
      backgroundPrimaryColor: Color.lerp(
        backgroundPrimaryColor,
        other.backgroundPrimaryColor,
        t,
      )!,
      backgroundSecondaryColor: Color.lerp(
        backgroundSecondaryColor,
        other.backgroundSecondaryColor,
        t,
      )!,
      backgroundTertiaryColor: Color.lerp(
        backgroundTertiaryColor,
        other.backgroundTertiaryColor,
        t,
      )!,
      smallChevronBackgroundColor: Color.lerp(
        smallChevronBackgroundColor,
        other.smallChevronBackgroundColor,
        t,
      )!,
      accentColor: Color.lerp(
        accentColor,
        other.accentColor,
        t,
      )!,
    );
  }
}
