import 'package:boletozz/app_imports.dart';

class HiveConfig {
  static Future<void> start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter(BillModelAdapter());
    await Hive.openBox<BillModel>('bills');
  }
}
