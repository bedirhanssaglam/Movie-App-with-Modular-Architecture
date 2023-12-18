import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemodular/product/init/theme/colors/custom_color_scheme.dart';
import 'package:moviemodular/product/init/theme/interface/custom_theme.dart';

/// Custom light theme for project design
final class LightThemeManager implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          elevation: 3,
        ),
      );
}
