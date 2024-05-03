import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AppHelperFunctions {
  AppHelperFunctions._();
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double sceenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sceenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String getFormattedCurrency(double valor) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(valor);
  }
}
