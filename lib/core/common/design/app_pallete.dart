import 'package:flutter/material.dart';

class AppPallete {
  AppPallete._();

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color light = Color(0xFFEEEEEE);
  static const Color dark = Color(0xFF040D12);
  static const Color lightDark = Color.fromARGB(255, 64, 71, 84);

  static const Color primary = Color(0xFF183D3D);
  static const Color secondary = Color(0xFF5C8374);
  static const Color accent = Color(0xFF93B1A6);

  static const Color gradient1 = Color(0xFF020024);
  static const Color gradient2 = Color.fromARGB(255, 49, 69, 100);
  static const Color gradient3 = Color(0xFF456273);

  static const Gradient linearGradient = LinearGradient(
    colors: [
      gradient1,
      gradient2,
      gradient3,
    ],
  );

  static const Color border = Color.fromRGBO(52, 51, 67, 1);
  static const Color grey = Colors.grey;

  static const Color transparent = Colors.transparent;

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
}
