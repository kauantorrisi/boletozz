import 'package:boletozz/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(
    const MainApp(),
  );
}
