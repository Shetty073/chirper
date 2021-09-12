import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeHelper {
  static DateTime getParsedDate(String createdAt) {
    DateTime date = DateTime.parse(createdAt).toLocal();
    return date;
  }

  static String getFormattedDate(DateTime date) {
    String formattedDate = DateFormat('MMM d').format(date); // default format

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);


    final dateToCheck = date;
    final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if(dateToCheck.year != now.year) {
      formattedDate = DateFormat('MMM d, y').format(date);
    } else if(aDate == today || aDate == yesterday) {
      formattedDate = timeago.format(date, locale: 'en_short');
    }

    return '· ${formattedDate}';
  }
}
