
import 'package:flutter/material.dart';


class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color onPrimary;
  final Color primaryLight;  

  // Surface & Background 
  final Color background;
  final Color surface;        
  final Color surfaceVariant; 

  // Text 
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;      

  // Word detail 
  final Color partOfSpeechBg; 
  final Color partOfSpeechText;
  final Color phoneticText;  
  final Color exampleText;   
  final Color divider;       

  // Status 
  final Color offlineBanner;    
  final Color offlineBannerText;
  final Color bookmarkActive;    
  final Color bookmarkInactive;  

  // Source badge (remote / cache / bundled) 
  final Color sourceBadgeBg;
  final Color sourceBadgeText;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryLight,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.partOfSpeechBg,
    required this.partOfSpeechText,
    required this.phoneticText,
    required this.exampleText,
    required this.divider,
    required this.offlineBanner,
    required this.offlineBannerText,
    required this.bookmarkActive,
    required this.bookmarkInactive,
    required this.sourceBadgeBg,
    required this.sourceBadgeText,
  });

  // Light theme
  static const light = AppColors(
    primary: Color(0xFFFF6B35), 
    onPrimary: Color(0xFFFFFFFF),
    primaryLight: Color(0xFFFFEDE6),

    background: Color(0xFFFFF8F0), 
    surface: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFFFF3E8),

    textPrimary: Color(0xFF2D1B0E),
    textSecondary: Color(0xFF6B4226),
    textHint: Color(0xFFAA8070),

    partOfSpeechBg: Color(0xFFFF6B35),
    partOfSpeechText: Color(0xFFFFFFFF),
    phoneticText: Color(0xFF8B5E3C),
    exampleText: Color(0xFF7A5230),
    divider: Color(0xFFEDD9C8),

    offlineBanner: Color(0xFFFF6B35),
    offlineBannerText: Color(0xFFFFFFFF),
    bookmarkActive: Color(0xFFFF6B35),
    bookmarkInactive: Color(0xFFAA8070),

    sourceBadgeBg: Color(0xFFFFF3E8),
    sourceBadgeText: Color(0xFFFF6B35),
  );

  //  Dark theme 
  static const dark = AppColors(
    primary: Color(0xFFFF8C5A), 
    onPrimary: Color(0xFF1A0A00),
    primaryLight: Color(0xFF3D1A08),

    background: Color(0xFF120A04), 
    surface: Color(0xFF1E1008),
    surfaceVariant: Color(0xFF2A1610),

    textPrimary: Color(0xFFFFF0E6),
    textSecondary: Color(0xFFD4A882),
    textHint: Color(0xFF8A6050),

    partOfSpeechBg: Color(0xFFFF8C5A),
    partOfSpeechText: Color(0xFF1A0A00),
    phoneticText: Color(0xFFD4A070),
    exampleText: Color(0xFFB8865C),
    divider: Color(0xFF3A2018),

    offlineBanner: Color(0xFF3D1A08),
    offlineBannerText: Color(0xFFFF8C5A),
    bookmarkActive: Color(0xFFFF8C5A),
    bookmarkInactive: Color(0xFF8A6050),

    sourceBadgeBg: Color(0xFF3D1A08),
    sourceBadgeText: Color(0xFFFF8C5A),
  );

  @override
  AppColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryLight,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? textHint,
    Color? partOfSpeechBg,
    Color? partOfSpeechText,
    Color? phoneticText,
    Color? exampleText,
    Color? divider,
    Color? offlineBanner,
    Color? offlineBannerText,
    Color? bookmarkActive,
    Color? bookmarkInactive,
    Color? sourceBadgeBg,
    Color? sourceBadgeText,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryLight: primaryLight ?? this.primaryLight,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      partOfSpeechBg: partOfSpeechBg ?? this.partOfSpeechBg,
      partOfSpeechText: partOfSpeechText ?? this.partOfSpeechText,
      phoneticText: phoneticText ?? this.phoneticText,
      exampleText: exampleText ?? this.exampleText,
      divider: divider ?? this.divider,
      offlineBanner: offlineBanner ?? this.offlineBanner,
      offlineBannerText: offlineBannerText ?? this.offlineBannerText,
      bookmarkActive: bookmarkActive ?? this.bookmarkActive,
      bookmarkInactive: bookmarkInactive ?? this.bookmarkInactive,
      sourceBadgeBg: sourceBadgeBg ?? this.sourceBadgeBg,
      sourceBadgeText: sourceBadgeText ?? this.sourceBadgeText,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      partOfSpeechBg: Color.lerp(partOfSpeechBg, other.partOfSpeechBg, t)!,
      partOfSpeechText: Color.lerp(partOfSpeechText, other.partOfSpeechText, t)!,
      phoneticText: Color.lerp(phoneticText, other.phoneticText, t)!,
      exampleText: Color.lerp(exampleText, other.exampleText, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      offlineBanner: Color.lerp(offlineBanner, other.offlineBanner, t)!,
      offlineBannerText: Color.lerp(offlineBannerText, other.offlineBannerText, t)!,
      bookmarkActive: Color.lerp(bookmarkActive, other.bookmarkActive, t)!,
      bookmarkInactive: Color.lerp(bookmarkInactive, other.bookmarkInactive, t)!,
      sourceBadgeBg: Color.lerp(sourceBadgeBg, other.sourceBadgeBg, t)!,
      sourceBadgeText: Color.lerp(sourceBadgeText, other.sourceBadgeText, t)!,
    );
  }
}