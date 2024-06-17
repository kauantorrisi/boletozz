import 'package:boletozz/app_imports.dart';
import 'package:boletozz/modules/bills/widgets/bill_info_widget.dart';

class EditBillPage extends StatelessWidget {
  const EditBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BillModel bill =
        ModalRoute.of(context)!.settings.arguments as BillModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar o boleto: ${bill.name}'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.sm,
          horizontal: AppSizes.sm,
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              BillInfoWidget(
                icon: Icons.text_snippet_outlined,
                isText: false,
                bill: bill,
                extended: true,
              ),
              BillInfoWidget(
                icon: LucideIcons.piggy_bank,
                isText: false,
                bill: bill,
                extended: true,
              ),
              BillInfoWidget(
                icon: LucideIcons.dollar_sign,
                isText: false,
                bill: bill,
                extended: true,
              ),
              BillInfoWidget(
                icon: LucideIcons.calendar_clock,
                isText: false,
                bill: bill,
                extended: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
