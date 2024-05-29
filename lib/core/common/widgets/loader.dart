import 'package:boletozz/app_imports.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHelperFunctions.sceenHeight(context) * 0.75,
      width: AppHelperFunctions.sceenWidth(context),
      child: Center(
        child: LoadingAnimationWidget.dotsTriangle(
          color: AppPallete.accent,
          size: AppSizes.iconLg,
        ),
      ),
    );
  }
}
