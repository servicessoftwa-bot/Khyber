import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light(useMaterial3: true);
    final poppinsTextTheme = GoogleFonts.poppinsTextTheme(base.textTheme).copyWith(
      displayLarge:   GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 57, color: AppColors.textPrimary, letterSpacing: -1.0),
      displayMedium:  GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 45, color: AppColors.textPrimary),
      displaySmall:   GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 36, color: AppColors.textPrimary),
      headlineLarge:  GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 32, color: AppColors.textPrimary),
      headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 28, color: AppColors.textPrimary),
      titleLarge:     GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 22, color: AppColors.textPrimary),
      titleMedium:    GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.textPrimary),
      titleSmall:     GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textPrimary),
      bodyLarge:      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.textPrimary, height: 1.6),
      bodyMedium:     GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textSecondary, height: 1.6),
      bodySmall:      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.textSecondary),
      labelLarge:     GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
      labelMedium:    GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13),
      labelSmall:     GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 11, letterSpacing: 0.4),
    );

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      iconTheme: const IconThemeData(size: 24, color: AppColors.textPrimary),
      textTheme: poppinsTextTheme,
      colorScheme: const ColorScheme.light(
        primary:     AppColors.primary,
        secondary:   AppColors.accent,
        surface:     AppColors.surface,
        error:       AppColors.error,
        onPrimary:   Colors.white,
        onSecondary: Colors.white,
        onSurface:   AppColors.textPrimary,
        onError:     Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          shadowColor: Colors.transparent,
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 54),
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: AppColors.textHint),
        labelStyle: GoogleFonts.poppins(fontSize: 14, color: AppColors.textSecondary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 2,
        shadowColor: AppColors.primary.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border, width: 0.8),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.primaryLight,
        selectedColor: AppColors.primary,
        labelStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
