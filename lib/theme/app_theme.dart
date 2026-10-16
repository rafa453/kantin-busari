import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  final Color surface;
  final Color surfaceLow;
  final Color surfaceLowest;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color onSurface;
  final Color onVariant;
  final Color primary;
  final Color primaryContainer;
  final Color primaryFixed;
  final Color secondary;
  final Color secondaryContainer;
  final Color tertiaryContainer;
  final Color tertiaryFixed;
  final Color onTertiaryFixedVar;
  final Color outline;
  final Color outlineVariant;
  final Color error;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color tertiary;

  const AppPalette({
    required this.surface,
    required this.surfaceLow,
    required this.surfaceLowest,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.onSurface,
    required this.onVariant,
    required this.primary,
    required this.primaryContainer,
    required this.primaryFixed,
    required this.secondary,
    required this.secondaryContainer,
    required this.tertiaryContainer,
    required this.tertiaryFixed,
    required this.onTertiaryFixedVar,
    required this.outline,
    required this.outlineVariant,
    required this.error,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.tertiary,
  });

  static const light = AppPalette(
    surface: Color(0xFFFBF9F9),
    surfaceLow: Color(0xFFF5F3F3),
    surfaceLowest: Color(0xFFFFFFFF),
    surfaceContainer: Color(0xFFEFEDED),
    surfaceContainerHigh: Color(0xFFE9E8E7),
    onSurface: Color(0xFF1B1C1C),
    onVariant: Color(0xFF40493D),
    primary: Color(0xFF0D631B),
    primaryContainer: Color(0xFF2E7D32),
    primaryFixed: Color(0xFFA3F69C),
    secondary: Color(0xFF006E1C),
    secondaryContainer: Color(0xFF98F994),
    tertiaryContainer: Color(0xFF9C6000),
    tertiaryFixed: Color(0xFFFFDDBA),
    onTertiaryFixedVar: Color(0xFF663D00),
    outline: Color(0xFF707A6C),
    outlineVariant: Color(0xFFBFCABA),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    tertiary: Color(0xFF7A4A00),
  );

  static const dark = AppPalette(
    surface: Color(0xFF101310),
    surfaceLow: Color(0xFF191D19),
    surfaceLowest: Color(0xFF0C0F0C),
    surfaceContainer: Color(0xFF1D211D),
    surfaceContainerHigh: Color(0xFF272B27),
    onSurface: Color(0xFFE1E3DF),
    onVariant: Color(0xFFBFC9BB),
    primary: Color(0xFF88D982),
    primaryContainer: Color(0xFF2E7D32),
    primaryFixed: Color(0xFF2E5B33),
    secondary: Color(0xFF7DDC7A),
    secondaryContainer: Color(0xFF14421C),
    tertiaryContainer: Color(0xFFB4791A),
    tertiaryFixed: Color(0xFF4A3418),
    onTertiaryFixedVar: Color(0xFFFFD9A6),
    outline: Color(0xFF8A958A),
    outlineVariant: Color(0xFF3A4437),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF5C0F0A),
    onErrorContainer: Color(0xFFFFDAD6),
    tertiary: Color(0xFFFFB865),
  );

  @override
  AppPalette copyWith({
    Color? surface,
    Color? surfaceLow,
    Color? surfaceLowest,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? onSurface,
    Color? onVariant,
    Color? primary,
    Color? primaryContainer,
    Color? primaryFixed,
    Color? secondary,
    Color? secondaryContainer,
    Color? tertiaryContainer,
    Color? tertiaryFixed,
    Color? onTertiaryFixedVar,
    Color? outline,
    Color? outlineVariant,
    Color? error,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? tertiary,
  }) {
    return AppPalette(
      surface: surface ?? this.surface,
      surfaceLow: surfaceLow ?? this.surfaceLow,
      surfaceLowest: surfaceLowest ?? this.surfaceLowest,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      onSurface: onSurface ?? this.onSurface,
      onVariant: onVariant ?? this.onVariant,
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      onTertiaryFixedVar: onTertiaryFixedVar ?? this.onTertiaryFixedVar,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      error: error ?? this.error,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceLow: Color.lerp(surfaceLow, other.surfaceLow, t)!,
      surfaceLowest: Color.lerp(surfaceLowest, other.surfaceLowest, t)!,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHigh: Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onVariant: Color.lerp(onVariant, other.onVariant, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      primaryFixed: Color.lerp(primaryFixed, other.primaryFixed, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      tertiaryFixed: Color.lerp(tertiaryFixed, other.tertiaryFixed, t)!,
      onTertiaryFixedVar: Color.lerp(onTertiaryFixedVar, other.onTertiaryFixedVar, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}

extension AppPaletteX on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>() ?? AppPalette.light;
}

// Legacy light constants kept for accent usage that reads acceptably in both modes.
class AppColors {
  static const primary = Color(0xFF0D631B);
  static const primaryContainer = Color(0xFF2E7D32);
  static const primaryFixed = Color(0xFFA3F69C);
  static const mint = Color(0xFFCBFFC2);
}

class AppText {
  static const headlineLgMobile = TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.27);
  static const headlineMd = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1.3);
  static const headlineSm = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.37);
  static const bodyLg = TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.46);
  static const bodyMd = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 1.38);
  static const bodySm = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, height: 1.36);
  static const labelLg = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.42);
  static const labelMd = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33);
  static const labelSm = TextStyle(fontSize: 10, fontWeight: FontWeight.w700, height: 1.4, letterSpacing: 0.2);
}

ThemeData _base(ColorScheme scheme, AppPalette palette) => ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.surface,
      extensions: [palette],
    );

ThemeData appTheme = _base(
  const ColorScheme.light(
    primary: Color(0xFF0D631B),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF2E7D32),
    secondary: Color(0xFF006E1C),
    surface: Color(0xFFFBF9F9),
    onSurface: Color(0xFF1B1C1C),
    error: Color(0xFFBA1A1A),
  ),
  AppPalette.light,
);

ThemeData appDarkTheme = _base(
  const ColorScheme.dark(
    primary: Color(0xFF88D982),
    onPrimary: Color(0xFF003909),
    primaryContainer: Color(0xFF2E7D32),
    secondary: Color(0xFF7DDC7A),
    surface: Color(0xFF101310),
    onSurface: Color(0xFFE1E3DF),
    error: Color(0xFFFFB4AB),
  ),
  AppPalette.dark,
);