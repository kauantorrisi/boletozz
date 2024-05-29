import 'package:boletozz/app_imports.dart';

class MenuButton extends StatelessWidget {
  final BuildContext context;
  final Function() onPressed;
  final IconData icon;
  final Color? iconColor;
  final String text;
  final Color? textColor;

  const MenuButton(
    this.context, {
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: onPressed,
      leadingIcon: Icon(icon, color: iconColor ?? AppPallete.white),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: textColor ?? AppPallete.white),
      ),
    );
  }
}
