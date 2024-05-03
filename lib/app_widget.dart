import 'package:flutter/material.dart';

import 'package:boletozz/core/common/design/theme/theme.dart';
import 'package:boletozz/features/home/pages/home_page.dart';
import 'package:boletozz/features/home/pages/splash_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Boletozz",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: "/",
      routes: {
        "/": (_) => const SplashPage(),
        "/home": (_) => const HomePage(),
      },
    );
  }
}
