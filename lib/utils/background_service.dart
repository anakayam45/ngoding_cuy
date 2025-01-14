import 'dart:isolate';
import 'dart:ui';
import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'notification_settings.dart';

import '../jamal.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();
  void initializeIsolate() async {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
    if (Platform.isAndroid) {
      await AndroidAlarmManager.initialize();
    }
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final MyNotification notificationHelper = MyNotification();
    await notificationHelper.showNotification(flutterLocalNotificationsPlugin);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
