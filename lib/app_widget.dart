import 'package:boletozz/app_imports.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => BillsCubit(),
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/bill-details',
          builder: (context, state) => BlocProvider(
            create: (context) => BillsCubit(),
            child: BillDetailsPage(bill: state.extra! as BillModel),
          ),
        )
      ],
    );

    return ScreenUtilInit(
      designSize: Size(
        AppHelperFunctions.sceenWidth(context),
        AppHelperFunctions.sceenHeight(context),
      ),
      builder: (_, context) => MaterialApp.router(
        title: "Boletozz",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}
