import 'package:boletozz/app_imports.dart';
import 'package:boletozz/core/common/design/theme/custom_themes/app_bar_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Poppins",
    appBarTheme: MyAppBarTheme.appBarTheme,
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
    appBarTheme: MyAppBarTheme.appBarTheme,
    scaffoldBackgroundColor: AppPallete.dark,
    textTheme: AppTextThemes.darkTextTheme,
    inputDecorationTheme: AppInputDecorationThemes.darkInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonThemes.darkElevatedButtonTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.darkFloatingActionButtonTheme,
  );
}
