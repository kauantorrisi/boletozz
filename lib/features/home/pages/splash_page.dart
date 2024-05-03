import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/app_pallete.dart';
import 'package:boletozz/core/common/design/app_sizes.dart';
import 'package:boletozz/core/utils/helpers_functions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primary,
      body: SizedBox(
        height: AppHelperFunctions.sceenHeight(context),
        width: AppHelperFunctions.sceenWidth(context),
        child: const Center(
          child: Text(
            "Boletozz",
            style: TextStyle(
              color: AppPallete.light,
              fontSize: AppSizes.xl,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
