import 'package:boletozz/app_imports.dart';

class BillInfoWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final bool extended;
  final bool isText;
  final BillModel bill;
  final String? text;

  const BillInfoWidget({
    super.key,
    required this.icon,
    this.iconColor,
    this.extended = false,
    required this.isText,
    required this.bill,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHelperFunctions.sceenHeight(context) * 0.08,
      width: extended
          ? AppHelperFunctions.sceenWidth(context) * 0.95
          : AppHelperFunctions.sceenWidth(context) * 0.46,
      decoration: BoxDecoration(
        color: bill.isPaid ? AppPallete.darkTertiary : AppPallete.darkRed,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
        border: Border.all(
          color: bill.isPaid ? AppPallete.tertiary : AppPallete.red,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: AppSizes.md),
            SizedBox(
              width: extended
                  ? AppHelperFunctions.sceenWidth(context) * 0.75
                  : AppHelperFunctions.sceenWidth(context) * 0.26,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: isText ? Text(text ?? '') : TextFormField(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
