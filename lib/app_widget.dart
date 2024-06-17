import 'package:boletozz/app_imports.dart';
import 'package:boletozz/modules/bills/ui/pages/edit_bill_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillsCubit(),
      child: ScreenUtilInit(
        designSize: Size(
          AppHelperFunctions.sceenWidth(context),
          AppHelperFunctions.sceenHeight(context),
        ),
        builder: (_, context) => MaterialApp(
          title: "Boletozz",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: '/',
          routes: {
            "/": (context) => const HomePage(),
            "/bill-details": (context) => const BillDetailsPage(),
            "/edit-bill": (context) => const EditBillPage(),
          },
        ),
      ),
    );
  }
}
