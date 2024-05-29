import 'package:intl/intl.dart';

import 'package:boletozz/app_imports.dart';

class AppHelperFunctions {
  AppHelperFunctions._();
  // DarkMode

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // ScreenSize

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double sceenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sceenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Formatters

  static String getFormattedDate(DateTime date,
      {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String getFormattedCurrency(double valor) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(valor);
  }

  // Clipboard

  static Future<void> copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
  }

  static Future<String> pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text ?? '';
  }

  static Future<bool> hasData() async => await Clipboard.hasStrings();

  // SnackBar

  static void showSnackBar(
    BuildContext context, {
    String title = '',
    String message = '',
    required ContentType contentType,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: 3),
          content: AwesomeSnackbarContent(
            title: title,
            titleFontSize: 16,
            message: message,
            messageFontSize: 16,
            contentType: contentType,
          ),
        ),
      );
  }

  // Dialog
  static void showConfirmationDialog(
    BuildContext context, {
    String title = "",
    String content = "",
    required VoidCallback onConfirmAction,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppPallete.darkTertiary,
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirmAction();
              },
              child: Text(
                'Remover',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppPallete.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
