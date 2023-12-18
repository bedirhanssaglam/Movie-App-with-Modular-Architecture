import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  const CustomColorScheme._();

  /// Light color scheme set
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xFF6750A4),
    primaryContainer: Color(0xFFEADDFF),
    secondary: Color(0xFF625B71),
    secondaryContainer: Color(0xFFE8DEF8),
    tertiary: Color(0xFF7D5260),
    tertiaryContainer: Color(0xFFFFD8E4),
    errorContainer: Color(0xFFF9DEDC),
    outline: Color(0xFF79747E),
    background: Color(0xFFFFFBFE),
    onBackground: Color(0xFF1C1B1F),
    surface: Color(0xFFFFFBFE),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6750A4),
    outlineVariant: Color(0xFFCAC4D0),
    scrim: Color(0xFF000000),
  );

  /// Dark color scheme set
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFFD0BCFF),
    primaryContainer: Color(0xFF4F378B),
    secondary: Color(0xFFCCC2DC),
    secondaryContainer: Color(0xFF4A4458),
    tertiary: Color(0xFFEFB8C8),
    tertiaryContainer: Color(0xFF633B48),
    errorContainer: Color(0xFF8C1D18),
    outline: Color(0xFF938F99),
    background: Color(0xFF1C1B1F),
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF6750A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD0BCFF),
    outlineVariant: Color(0xFF49454F),
    scrim: Color(0xFF000000),
  );
}
