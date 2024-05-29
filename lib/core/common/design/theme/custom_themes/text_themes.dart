import 'package:boletozz/app_imports.dart';

class AppTextThemes {
  AppTextThemes._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: AppPallete.textPrimary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppPallete.textPrimary,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppPallete.textPrimary,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppPallete.textPrimary,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppPallete.textPrimary,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppPallete.textPrimary,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppPallete.textPrimary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: AppPallete.textPrimary,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppPallete.textPrimary.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppPallete.textPrimary,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppPallete.textPrimary.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppPallete.textWhite,
      ),
      headlineMedium: const TextStyle().copyWith(
        fontSize: 24.sp.sp,
        fontWeight: FontWeight.w600,
        color: AppPallete.textWhite,
      ),
      headlineSmall: const TextStyle().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppPallete.textWhite,
      ),
      titleLarge: const TextStyle().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppPallete.textWhite,
      ),
      titleMedium: const TextStyle().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppPallete.textWhite,
      ),
      titleSmall: const TextStyle().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppPallete.textWhite,
      ),
      bodyLarge: const TextStyle().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppPallete.textWhite,
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppPallete.textWhite,
      ),
      bodySmall: const TextStyle().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppPallete.textWhite.withOpacity(0.5),
      ),
      labelLarge: const TextStyle().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppPallete.textWhite,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppPallete.textWhite.withOpacity(0.5),
      ),
      labelSmall: const TextStyle().copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: AppPallete.textWhite,
      ));
}
