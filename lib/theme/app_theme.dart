import 'package:flutter/material.dart';

class AppColors {
  static const surface = Color(0xFFFBF9F9);
  static const surfaceLow = Color(0xFFF5F3F3);
  static const surfaceLowest = Color(0xFFFFFFFF);
  static const surfaceContainer = Color(0xFFEFEDED);
  static const surfaceContainerHigh = Color(0xFFE9E8E7);
  static const onSurface = Color(0xFF1B1C1C);
  static const onVariant = Color(0xFF40493D);
  static const primary = Color(0xFF0D631B);
  static const primaryContainer = Color(0xFF2E7D32);
  static const primaryFixed = Color(0xFFA3F69C);
  static const secondary = Color(0xFF006E1C);
  static const secondaryContainer = Color(0xFF98F994);
  static const secondaryFixed = Color(0xFF98F994);
  static const tertiaryContainer = Color(0xFF9C6000);
  static const tertiaryFixed = Color(0xFFFFDDBA);
  static const onTertiaryFixedVar = Color(0xFF663D00);
  static const outline = Color(0xFF707A6C);
  static const outlineVariant = Color(0xFFBFCABA);
  static const error = Color(0xFFBA1A1A);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);
  static const tertiary = Color(0xFF7A4A00);
}

class AppText {
  static const headlineLgMobile = TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.27, color: AppColors.onSurface);
  static const headlineMd = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1.3, color: AppColors.onSurface);
  static const headlineSm = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.37, color: AppColors.onSurface);
  static const bodyLg = TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.46, color: AppColors.onVariant);
  static const bodyMd = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 1.38, color: AppColors.onVariant);
  static const bodySm = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, height: 1.36, color: AppColors.onVariant);
  static const labelLg = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.42, color: AppColors.onSurface);
  static const labelMd = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33, color: AppColors.onSurface);
  static const labelSm = TextStyle(fontSize: 10, fontWeight: FontWeight.w700, height: 1.4, letterSpacing: 0.2, color: AppColors.onSurface);
}

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.surface,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryContainer,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
  ),
);
