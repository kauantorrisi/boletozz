import 'package:boletozz/app_imports.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: ADICIONAR ANIMAÇÃO AO ABRIR E FECHAR SEARCHBAR
    return Padding(
      padding: EdgeInsets.only(
        top: AppSizes.sm,
        left: AppSizes.xs,
        right: AppSizes.xs,
      ),
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          // context.read<BillsCubit>().searchBills(value);
        },
        cursorColor: AppPallete.accent,
        textAlign: TextAlign.left,
        decoration: const InputDecoration(
          hintText: "Pesquise por boletos...",
          prefixIcon: Icon(LucideIcons.search),
        ),
      ),
    );
  }
}
