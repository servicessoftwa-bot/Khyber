import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary — deep saffron/terracotta inspired by Peshawar brick bazaars
  static const Color primary      = Color(0xFFB03A2E);
  static const Color primaryDark  = Color(0xFF7B241C);
  static const Color primaryLight = Color(0xFFFADDD9);

  // Accent — mountain slate blue-green
  static const Color accent      = Color(0xFF1A6B72);
  static const Color accentLight = Color(0xFFD4EEF0);

  // Gold — Peshawari craft / heritage highlight
  static const Color gold      = Color(0xFFD4A017);
  static const Color goldLight = Color(0xFFFDF3D7);

  // Status
  static const Color success = Color(0xFF1E7E34);
  static const Color error   = Color(0xFFC0392B);
  static const Color warning = Color(0xFFD68910);
  static const Color info    = Color(0xFF1A6B72);

  // Text
  static const Color textPrimary   = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6C6C70);
  static const Color textHint      = Color(0xFFAEAEB2);

  // Backgrounds — warm off-white
  static const Color background = Color(0xFFFBF7F4);
  static const Color surface    = Color(0xFFFFFFFF);
  static const Color card       = Color(0xFFFFFFFF);

  // Borders
  static const Color border  = Color(0xFFEDE0D8);
  static const Color divider = Color(0xFFD6C4BB);

  // Service category colors
  static const Color foodColor      = Color(0xFFE67E22);
  static const Color healthColor    = Color(0xFF2980B9);
  static const Color transportColor = Color(0xFF27AE60);
  static const Color educationColor = Color(0xFF8E44AD);
  static const Color emergencyColor = Color(0xFFC0392B);
  static const Color govtColor      = Color(0xFF2C3E50);
  static const Color tourismColor   = Color(0xFF16A085);
  static const Color craftsColor    = Color(0xFFD4A017);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFB03A2E), Color(0xFF1A6B72)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFB03A2E), Color(0xFFD4A017)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
