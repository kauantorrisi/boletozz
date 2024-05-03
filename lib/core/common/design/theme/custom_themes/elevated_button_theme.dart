import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/app_pallete.dart';
import 'package:boletozz/core/common/design/theme/custom_themes/text_themes.dart';

class AppElevatedButtonThemes {
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppPallete.primary,
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
      backgroundColor: AppPallete.primary,
      fixedSize: const Size(395, 55),
      foregroundColor: AppPallete.textWhite,
      textStyle: AppTextThemes.darkTextTheme.titleLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
