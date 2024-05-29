import 'package:boletozz/app_imports.dart';

class AppPallete {
  AppPallete._();

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color light = Color(0xFFEEEEEE);
  static const Color dark = Color(0xFF040D12);

  static const Color darkTertiary = Color.fromARGB(255, 14, 35, 35);
  static const Color tertiary = Color(0xFF183D3D);
  static const Color secondary = Color(0xFF266262);
  static const Color primary = Color(0xFF358686);
  static const Color accent = Color(0xFF43ABAB);

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
  static const Color darkGrey = Color.fromARGB(255, 64, 71, 84);

  static const Color transparent = Colors.transparent;

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  static const Color red = Color.fromARGB(255, 251, 95, 95);
  static const Color darkRed = Color.fromARGB(255, 45, 16, 16);
  static const Color green = Color(0xFF388E3C);
  static const Color yellow = Color(0xFFF57C00);
  static const Color blue = Color(0xFF1976D2);
}
