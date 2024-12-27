import 'package:flutter/material.dart';

import '../main.dart';
import 'background_service.dart';
import 'notification_settings.dart';

void initBackgroundAndNotification() {
  WidgetsFlutterBinding.ensureInitialized();

  final MyNotification myNotification = MyNotification();
  myNotification.initializeNotifications(flutterLocalNotificationsPlugin);

  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
}
