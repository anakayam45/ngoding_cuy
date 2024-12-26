import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:provider/provider.dart';

import '../utils/background_service.dart';
import '../utils/notification.dart';
import 'course_provider.dart';
import 'datetime_provider.dart';
import 'scheduled_provider.dart';

void mainProvider(main) async {
  WidgetsFlutterBinding.ensureInitialized();

  final MyNotification myNotification = MyNotification();
  myNotification.initializeNotifications(flutterLocalNotificationsPlugin);

  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TimeProvider()),
      ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ChangeNotifierProvider(create: (_) => CourseProvider())
    ],
    child: main,
  ));
}
