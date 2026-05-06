
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(AppColors.light, Brightness.light);
  static ThemeData get dark  => _build(AppColors.dark,  Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final base = brightness == Brightness.light
        ? ThemeData.light(useMaterial3: true)
        : ThemeData.dark(useMaterial3: true);

    const serifFamily = 'Georgia';

    return base.copyWith(
      extensions: [colors],

      scaffoldBackgroundColor: colors.background,

      colorScheme: ColorScheme(
        brightness:  brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.primary,
        onSecondary: colors.onPrimary,
        error: const Color(0xFFE63946),
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),

      textTheme: TextTheme(
        displayMedium: TextStyle(
          fontFamily: serifFamily,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: colors.textPrimary,
          letterSpacing: -0.5,
          height: 1.2,
        ),

        headlineLarge: TextStyle(
          fontFamily: serifFamily,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: colors.textPrimary,
          height: 1.2,
        ),

        headlineMedium: TextStyle(
          fontFamily: serifFamily,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: colors.textPrimary,
          height: 1.3,
        ),

        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight:  FontWeight.w700,
          color: colors.textPrimary,
          height: 1.3,
        ),

        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
          height: 1.4,
        ),

        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.65,
        ),

        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.55,
        ),

        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colors.textHint,
          height: 1.4,
        ),

        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
          letterSpacing: 0.1,
        ),

        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: colors.textHint,
          letterSpacing: 0.4,
        ),
      ),

      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 2,
        shadowColor: colors.primary.withValues(alpha: .12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: colors.primary.withValues(alpha: .1),
        titleTextStyle: TextStyle(
          fontFamily: serifFamily,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: colors.textPrimary,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        hintStyle: TextStyle(
          color: colors.textHint,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceVariant,
        selectedColor: colors.primaryLight,
        labelStyle: TextStyle(
          fontSize: 13,
          color: colors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide(color: colors.divider),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),

      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
      ),

      iconTheme: IconThemeData(
        color: colors.textSecondary,
        size: 22,
      ),
    );
  }
}