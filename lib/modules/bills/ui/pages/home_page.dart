import 'package:boletozz/app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  bool isFiltering = false;

  void toggleIsSearching() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  void toggleIsFiltering() {
    setState(() {
      isFiltering = !isFiltering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BillsCubit billsCubit = context.read<BillsCubit>();

    return BlocConsumer<BillsCubit, BillsState>(
      bloc: billsCubit,
      listener: (context, state) {
        if (state is BillsError) {
          AppHelperFunctions.showSnackBar(
            context,
            title: state.title,
            message: state.message,
            contentType: ContentType.failure,
          );
        } else if (state is BillsLoading) {
          const Loader();
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: const Text("Meus Boletos"),
            backgroundColor: AppPallete.tertiary,
            actions: [
              IconButton(
                onPressed: toggleIsSearching,
                icon: Icon(
                  LucideIcons.search,
                  color: isSearching ? AppPallete.white : AppPallete.grey,
                ),
                visualDensity: VisualDensity.comfortable,
              ),
              IconButton(
                onPressed: toggleIsFiltering,
                icon: Icon(
                  LucideIcons.list_filter,
                  color: isFiltering ? AppPallete.white : AppPallete.grey,
                ),
                visualDensity: VisualDensity.comfortable,
              ),
            ],
          ),
          body: state is BillsLoaded && state.bills.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.sm,
                    left: AppSizes.sm,
                    right: AppSizes.sm,
                  ),
                  child: SizedBox(
                    height: AppHelperFunctions.sceenHeight(context),
                    child: ListView.builder(
                      itemCount: state.bills.length,
                      itemBuilder: (context, index) {
                        return _billTile(
                          context,
                          state.bills[index],
                          billsCubit: billsCubit,
                        );
                      },
                    ),
                  ),
                )
              : state is BillsLoaded && state.bills.isEmpty
                  ? const Center(child: Text("Nenhum boleto cadastrado"))
                  : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: BillFab(billsCubit: billsCubit),
        );
      },
    );
  }
}

Widget _billTile(
  BuildContext context,
  BillModel bill, {
  required BillsCubit billsCubit,
}) {
  final MenuController menuAnchorController = MenuController();

  return GestureDetector(
    onTap: () => context.go('/bill-details', extra: bill),
    child: Container(
      padding: EdgeInsets.all(AppSizes.sm),
      margin: EdgeInsets.only(bottom: AppSizes.sm),
      decoration: BoxDecoration(
        color: AppPallete.darkTertiary,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.xs),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              bill.isPaid ? LucideIcons.check_circle : LucideIcons.x_octagon,
              color: bill.isPaid ? AppPallete.green : AppPallete.red,
              size: 20.r,
            ),
            SizedBox(width: AppSizes.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            bill.name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  bill.isPaid
                      ? "Pago no dia ${AppHelperFunctions.getFormattedDate(DateTime.now())}"
                      : "Vence no dia: ${AppHelperFunctions.getFormattedDate(bill.dueDate)}",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: bill.isPaid ? AppPallete.green : AppPallete.red,
                      ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 70.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  AppHelperFunctions.getFormattedCurrency(bill.value),
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(width: AppSizes.sm),
            MenuAnchor(
              controller: menuAnchorController,
              style: const MenuStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppPallete.darkTertiary),
                visualDensity: VisualDensity.comfortable,
              ),
              menuChildren: [
                MenuButton(
                  context,
                  onPressed: () => billsCubit.toggleBillPaymentStatus(bill),
                  icon: bill.isPaid
                      ? LucideIcons.x_octagon
                      : LucideIcons.check_circle,
                  text: bill.isPaid
                      ? "Definir como pendente"
                      : "Definir como pago",
                ),
                _divider(),
                MenuButton(
                  context,
                  onPressed: () =>
                      AppHelperFunctions.copyToClipboard(bill.code),
                  icon: LucideIcons.clipboard_copy,
                  text: "Copiar código de barras",
                ),
                _divider(),
                MenuButton(
                  context,
                  onPressed: () {},
                  icon: LucideIcons.pencil,
                  text: "Editar",
                ),
                _divider(),
                MenuButton(
                  context,
                  onPressed: () => billsCubit.removeBill(bill),
                  icon: LucideIcons.trash_2,
                  iconColor: AppPallete.red,
                  text: "Excluir",
                  textColor: AppPallete.red,
                ),
              ],
              child: IconButton(
                onPressed: () {
                  if (menuAnchorController.isOpen) {
                    menuAnchorController.close();
                  } else {
                    menuAnchorController.open();
                  }
                },
                visualDensity: VisualDensity.compact,
                icon: const Icon(LucideIcons.more_vertical),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _divider() {
  return Divider(
    indent: AppSizes.sm,
    endIndent: AppSizes.xs,
    color: AppPallete.primary,
    height: 5,
  );
}
