import 'package:boletozz/app_imports.dart';

class AppElevatedButtonThemes {
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppPallete.tertiary,
      fixedSize: const Size(395, 55),
      foregroundColor: AppPallete.textWhite,
      textStyle: AppTextThemes.darkTextTheme.titleLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppPallete.tertiary,
      fixedSize: const Size(395, 55),
      foregroundColor: AppPallete.textWhite,
      textStyle: AppTextThemes.darkTextTheme.titleLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
