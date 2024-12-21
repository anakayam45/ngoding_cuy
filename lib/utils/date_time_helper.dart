import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format(TimeOfDay specifiedTime) {
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    String timeSpecific = '${specifiedTime.hour}:${specifiedTime.minute}:59';
    final completeFormat = DateFormat('y/M/d H:m:s');
    print(now);
    print(timeSpecific);

    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $timeSpecific";
    var resultToday = completeFormat.parseStrict(todayDateAndTime);

    var formatted = resultToday.add(const Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    var resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}
