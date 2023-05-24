import 'package:intl/intl.dart';

// ignore_for_file: prefer-match-file-name

extension DateTimeExtension on int {
  DateTime get fromInt => DateTime.fromMillisecondsSinceEpoch(this * 1000);

  String get stringDT {
    final formatter = DateFormat('dd.MM.yyyy HH:mm');
    final result = formatter.format(fromInt);

    return result;
  }

  String declension(String one, String two, String five) {
    var number = this % 100;
    if (number >= 5 && number <= 20) {
      return '$this $five';
    }
    number %= 10;
    if (number == 1) {
      return '$this $one';
    }
    if (number >= 2 && number <= 4) {
      return '$this $two';
    }

    return '$this $five';
  }
}
