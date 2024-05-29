import 'package:boletozz/app_imports.dart';

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
      backgroundColor: AppPallete.darkTertiary,
      body: SizedBox(
        height: AppHelperFunctions.sceenHeight(context),
        width: AppHelperFunctions.sceenWidth(context),
        child: Center(
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
