import 'package:boletozz/app_imports.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppPallete.light,
    textTheme: AppTextThemes.lightTextTheme,
    inputDecorationTheme: AppInputDecorationThemes.lightInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonThemes.lightElevatedButtonTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.lightFloatingActionButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppPallete.dark,
    textTheme: AppTextThemes.darkTextTheme,
    inputDecorationTheme: AppInputDecorationThemes.darkInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonThemes.darkElevatedButtonTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.darkFloatingActionButtonTheme,
  );
}
