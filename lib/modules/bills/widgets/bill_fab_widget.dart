import 'package:boletozz/app_imports.dart';

class BillFab extends StatefulWidget {
  final BillsCubit billsCubit;
  const BillFab({super.key, required this.billsCubit});

  @override
  State<BillFab> createState() => _BillFabState();
}

class _BillFabState extends State<BillFab> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    return FloatingActionButton(
      child: const Icon(LucideIcons.plus),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: AppPallete.darkTertiary,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.md,
                    horizontal: AppSizes.sm,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
                        child: TextFormField(
                          controller: nameController,
                          cursorColor: AppPallete.accent,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(LucideIcons.pen_line),
                            hintText: "Insira o nome do boleto",
                            hintStyle: const TextStyle(
                              color: AppPallete.white,
                            ),
                            labelStyle: const TextStyle(
                              color: AppPallete.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppPallete.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      _buttonWithIconAndText(
                        context,
                        icon: LucideIcons.scan_line,
                        text: "Escanear o boleto",
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.billsCubit.addBillByScan(nameController);
                        },
                      ),
                      SizedBox(height: AppSizes.sm),
                      const TextWithDivider(text: "ou"),
                      SizedBox(height: AppSizes.sm),
                      _buttonWithIconAndText(
                        context,
                        icon: LucideIcons.image,
                        text: "Selecionar imagem do boleto",
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.billsCubit.addBillByFile(nameController);
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

Widget _buttonWithIconAndText(
  BuildContext context, {
  required IconData icon,
  required String text,
  required Function() onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom().copyWith(
      backgroundColor:
          MaterialStateProperty.all(AppPallete.primary.withOpacity(0.5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppPallete.white),
        SizedBox(width: AppSizes.spaceBtwItems),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12),
        ),
      ],
    ),
  );
}
