import 'package:boletozz/app_imports.dart';

class AppFloatingActionButtonTheme {
  static FloatingActionButtonThemeData lightFloatingActionButtonTheme =
      const FloatingActionButtonThemeData(
          backgroundColor: AppPallete.accent,
          foregroundColor: AppPallete.black,
          iconSize: 30);

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme =
      const FloatingActionButtonThemeData(
    backgroundColor: AppPallete.secondary,
    foregroundColor: AppPallete.white,
    iconSize: 30,
  );
}
