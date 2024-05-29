import 'package:boletozz/app_imports.dart';

class BillDetailsPage extends StatefulWidget {
  final BillModel bill;
  const BillDetailsPage({super.key, required this.bill});

  @override
  State<BillDetailsPage> createState() => _BillDetailsPageState();
}

class _BillDetailsPageState extends State<BillDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final BillsCubit billsCubit = BlocProvider.of<BillsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bill.name,
          style: const TextStyle(color: AppPallete.white),
        ),
        backgroundColor: AppPallete.tertiary,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(LucideIcons.arrow_left, color: AppPallete.white),
        ),
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(LucideIcons.pencil, color: AppPallete.white),
          ),
          IconButton(
            onPressed: () =>
                AppHelperFunctions.copyToClipboard(widget.bill.code),
            icon: const Icon(
              LucideIcons.clipboard_copy,
              color: AppPallete.white,
            ),
          ),
          IconButton(
            onPressed: () {
              billsCubit.removeBill(widget.bill);
              context.pop();
            },
            icon: const Icon(LucideIcons.trash_2, color: AppPallete.red),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.sm,
          horizontal: AppSizes.sm,
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _container(
                  context,
                  isPaid: widget.bill.isPaid,
                  iconColor:
                      widget.bill.isPaid ? AppPallete.accent : AppPallete.red,
                  color: widget.bill.isPaid
                      ? AppPallete.darkTertiary
                      : AppPallete.darkRed,
                  text: "Nome:\n${widget.bill.name}",
                  icon: Icons.text_snippet_outlined,
                ),
                SizedBox(width: AppSizes.sm),
                _container(context,
                    isPaid: widget.bill.isPaid,
                    iconColor:
                        widget.bill.isPaid ? AppPallete.accent : AppPallete.red,
                    color: widget.bill.isPaid
                        ? AppPallete.darkTertiary
                        : AppPallete.darkRed,
                    text: "Banco Emissor:\n${widget.bill.emittingBank}",
                    icon: LucideIcons.piggy_bank),
              ],
            ),
            SizedBox(height: AppSizes.sm),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _container(
                  context,
                  isPaid: widget.bill.isPaid,
                  iconColor:
                      widget.bill.isPaid ? AppPallete.accent : AppPallete.red,
                  color: widget.bill.isPaid
                      ? AppPallete.darkTertiary
                      : AppPallete.darkRed,
                  icon: LucideIcons.dollar_sign,
                  text:
                      "Valor do Boleto:\n${AppHelperFunctions.getFormattedCurrency(widget.bill.value)}",
                ),
                SizedBox(width: AppSizes.sm),
                _container(
                  context,
                  isPaid: widget.bill.isPaid,
                  iconColor:
                      widget.bill.isPaid ? AppPallete.accent : AppPallete.red,
                  color: widget.bill.isPaid
                      ? AppPallete.darkTertiary
                      : AppPallete.darkRed,
                  text: widget.bill.isPaid
                      ? "Pagou dia:\n${AppHelperFunctions.getFormattedDate(widget.bill.paymentDate!)}"
                      : "Vencimento:\n${AppHelperFunctions.getFormattedDate(widget.bill.dueDate)}",
                  icon: LucideIcons.calendar_clock,
                ),
              ],
            ),
            SizedBox(height: AppSizes.sm),
            _container(
              context,
              isPaid: widget.bill.isPaid,
              iconColor:
                  widget.bill.isPaid ? AppPallete.accent : AppPallete.red,
              color: widget.bill.isPaid
                  ? AppPallete.darkTertiary
                  : AppPallete.darkRed,
              icon: LucideIcons.barcode,
              text: "Código de Barras:\n${widget.bill.code}",
              extended: true,
            ),
            SizedBox(height: AppSizes.sm),
            const Spacer(flex: 10),
            OutlinedButton.icon(
              onPressed: () => setState(() {
                billsCubit.toggleBillPaymentStatus(widget.bill);
              }),
              icon: Icon(
                widget.bill.isPaid
                    ? LucideIcons.x_octagon
                    : LucideIcons.check_circle,
                color: widget.bill.isPaid ? AppPallete.red : AppPallete.accent,
              ),
              label: Text(
                widget.bill.isPaid
                    ? "Definir como pendente"
                    : "Definir como pago",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.bill.isPaid
                          ? AppPallete.red
                          : AppPallete.accent,
                    ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget _container(
  BuildContext context, {
  required IconData icon,
  required String text,
  required Color? color,
  required Color? iconColor,
  bool extended = false,
  required bool isPaid,
}) {
  return Container(
    height: AppHelperFunctions.sceenHeight(context) * 0.08,
    width: extended
        ? AppHelperFunctions.sceenWidth(context) * 0.95
        : AppHelperFunctions.sceenWidth(context) * 0.46,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
      border: Border.all(color: isPaid ? AppPallete.tertiary : AppPallete.red),
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
              child: Text(text),
            ),
          ),
        ],
      ),
    ),
  );
}
