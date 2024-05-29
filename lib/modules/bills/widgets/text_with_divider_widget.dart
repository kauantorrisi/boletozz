import 'package:boletozz/app_imports.dart';

class TextWithDivider extends StatelessWidget {
  final String text;
  const TextWithDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppPallete.accent),
        ),
        SizedBox(width: AppSizes.sm),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(width: AppSizes.sm),
        const Expanded(
          child: Divider(color: AppPallete.accent),
        ),
      ],
    );
  }
}
