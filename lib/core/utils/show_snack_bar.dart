import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/app_pallete.dart';

void showSnackBar(BuildContext context, String message, bool isError) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppPallete.textWhite),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? AppPallete.error : AppPallete.success,
      ),
    );
}
