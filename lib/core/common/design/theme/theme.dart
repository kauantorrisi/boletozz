import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/app_pallete.dart';
import 'package:boletozz/core/common/design/theme/custom_themes/elevated_button_theme.dart';
import 'package:boletozz/core/common/design/theme/custom_themes/input_decoration_themes.dart';
import 'package:boletozz/core/common/design/theme/custom_themes/text_themes.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppPallete.light,
    textTheme: AppTextThemes.lightTextTheme,
    inputDecorationTheme: AppInputDecorationThemes.lightInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonThemes.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppPallete.dark,
    textTheme: AppTextThemes.darkTextTheme,
    inputDecorationTheme: AppInputDecorationThemes.darkInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonThemes.darkElevatedButtonTheme,
  );
}
