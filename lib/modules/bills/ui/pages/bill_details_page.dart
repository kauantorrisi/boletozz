import 'package:boletozz/app_imports.dart';
import 'package:boletozz/modules/bills/widgets/bill_info_widget.dart';

class BillDetailsPage extends StatefulWidget {
  const BillDetailsPage({super.key});

  @override
  State<BillDetailsPage> createState() => _BillDetailsPageState();
}

class _BillDetailsPageState extends State<BillDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final BillsCubit billsCubit = context.read<BillsCubit>();
    final BillModel bill =
        ModalRoute.of(context)!.settings.arguments as BillModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bill.name,
          style: const TextStyle(color: AppPallete.white),
        ),
        backgroundColor: AppPallete.tertiary,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/edit-bill', arguments: bill),
            icon: const Icon(LucideIcons.pencil, color: AppPallete.white),
          ),
          IconButton(
            onPressed: () {
              billsCubit.removeBill(bill);
              Navigator.of(context).pop();
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
                BillInfoWidget(
                  isText: true,
                  iconColor: bill.isPaid ? AppPallete.accent : AppPallete.red,
                  bill: bill,
                  text: "Nome:\n${bill.name}",
                  icon: Icons.text_snippet_outlined,
                ),
                SizedBox(width: AppSizes.sm),
                BillInfoWidget(
                  isText: true,
                  iconColor: bill.isPaid ? AppPallete.accent : AppPallete.red,
                  bill: bill,
                  text: "Banco Emissor:\n${bill.emittingBank}",
                  icon: LucideIcons.piggy_bank,
                ),
              ],
            ),
            SizedBox(height: AppSizes.sm),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BillInfoWidget(
                  isText: true,
                  iconColor: bill.isPaid ? AppPallete.accent : AppPallete.red,
                  icon: LucideIcons.dollar_sign,
                  text:
                      "Valor do Boleto:\n${AppHelperFunctions.getFormattedCurrency(bill.value)}",
                  bill: bill,
                ),
                SizedBox(width: AppSizes.sm),
                BillInfoWidget(
                  isText: true,
                  iconColor: bill.isPaid ? AppPallete.accent : AppPallete.red,
                  text: bill.isPaid
                      ? "Pagou dia:\n${AppHelperFunctions.getFormattedDate(bill.paymentDate!)}"
                      : "Vencimento:\n${AppHelperFunctions.getFormattedDate(bill.dueDate)}",
                  icon: LucideIcons.calendar_clock,
                  bill: bill,
                ),
              ],
            ),
            SizedBox(height: AppSizes.sm),
            BillInfoWidget(
              isText: true,
              iconColor: bill.isPaid ? AppPallete.accent : AppPallete.red,
              icon: LucideIcons.barcode,
              text: "Código de Barras:\n${bill.code}",
              extended: true,
              bill: bill,
            ),
            SizedBox(height: AppSizes.sm),
            const Spacer(flex: 10),
            OutlinedButton.icon(
              onPressed: () => AppHelperFunctions.copyToClipboard(bill.code),
              icon: const Icon(
                LucideIcons.clipboard_copy,
                color: AppPallete.accent,
              ),
              label: Text(
                "Copiar código de barras",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppPallete.accent),
              ),
            ),
            SizedBox(height: AppSizes.sm),
            OutlinedButton.icon(
              onPressed: () => setState(() {
                billsCubit.toggleBillPaymentStatus(bill);
              }),
              icon: Icon(
                bill.isPaid ? LucideIcons.x_octagon : LucideIcons.check_circle,
                color: bill.isPaid ? AppPallete.red : AppPallete.accent,
              ),
              label: Text(
                bill.isPaid ? "Definir como pendente" : "Definir como pago",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: bill.isPaid ? AppPallete.red : AppPallete.accent,
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
