import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import '../utils/background_service.dart';
import '../utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value, TimeOfDay specifiedTime) async {
    _isScheduled = value;
    notifyListeners();

    const int alarmID = 1;
    if (_isScheduled) {
      print('Scheduling News Activated');

      // Menjadwalkan alarm dengan waktu yang diambil dari TimeOfDay
      return await AndroidAlarmManager.periodic(
        const Duration(minutes: 1),
        alarmID,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(specifiedTime),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(alarmID);
    }
  }
}
