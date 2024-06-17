import 'package:boletozz/app_imports.dart';

class MyAppBarTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppPallete.tertiary,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: AppPallete.light,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: AppPallete.light,
    ),
  );
}
