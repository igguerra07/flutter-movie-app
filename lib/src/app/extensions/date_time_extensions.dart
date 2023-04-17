// coverage:ignore-file
import 'package:intl/intl.dart';

enum DateFormatPatterns {
  ddMMyy('dd/MM/yyyy');

  final String value;

  const DateFormatPatterns(this.value);
}

extension DateTimeExtensions on DateTime {
  String ddmmyyyy() {
    final date = DateFormat('dd/MM/yyyy').format(this);
    return date;
  }
}

extension DateStringExtensions on String {
  String toDateFormat({
    DateFormatPatterns pattern = DateFormatPatterns.ddMMyy,
  }) {
    final dateTime = DateTime.parse(this);
    final date = DateFormat(pattern.value).format(dateTime);
    return date;
  }
}
