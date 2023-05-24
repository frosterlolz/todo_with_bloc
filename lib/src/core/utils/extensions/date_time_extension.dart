import 'package:intl/intl.dart';

extension CustomDateTime on DateTime {
  String get nearestDay {
    final dayNow = DateTime.now().day;
    final formatter = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY);

    if (day == dayNow) {
      return 'Сегодня';
    } else if (day == dayNow + 1) {
      return 'Завтра';
    } else {
      return formatter.format(this);
    }
  }
}
