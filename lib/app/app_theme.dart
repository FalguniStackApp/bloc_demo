import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: lightColorScheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.appPrimary,
    surfaceTint: AppColors.appLightPurple,
    onPrimary: AppColors.appWhite,
    primaryContainer: AppColors.appLightBlue100,
    onPrimaryContainer: AppColors.appPurple,
    secondary: AppColors.appTeal800,
    onSecondary: AppColors.appYellow,
    secondaryContainer: AppColors.appPurple100,
    onSecondaryContainer: AppColors.appPurple700,
    tertiary: AppColors.appPurple300,
    onTertiary: AppColors.appWhite,
    tertiaryContainer:  AppColors.appWhite300,
    onTertiaryContainer: AppColors.appRed100,
    error: AppColors.appRed,
    onError: AppColors.appWhite,
    errorContainer: AppColors.appLightRed100,
    onErrorContainer: AppColors.appRed900,
    surface: AppColors.appWhite50,
    onSurface: AppColors.appBlack700,
    onSurfaceVariant:  AppColors.appBlack100,
    outline: AppColors.appBlack150,
    outlineVariant: AppColors.appBlack50,
    shadow: AppColors.appBlack200,
    scrim: AppColors.appBlack,
    inverseSurface: AppColors.appGreen400,
    inversePrimary: AppColors.appTeal700,
  );
}
