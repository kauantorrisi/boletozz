import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/app_pallete.dart';
import 'package:boletozz/core/common/design/app_sizes.dart';
import 'package:boletozz/core/utils/helpers_functions.dart';

void showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.lg,
            horizontal: AppSizes.md,
          ),
          width: AppHelperFunctions.sceenWidth(context) * 0.8,
          height: AppHelperFunctions.sceenHeight(context) * 0.2,
          decoration: BoxDecoration(
            color: AppPallete.dark,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          ),
          child: Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(content, style: Theme.of(context).textTheme.bodyLarge),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "OK",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppPallete.accent),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
