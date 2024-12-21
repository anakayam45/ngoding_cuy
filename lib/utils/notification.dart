import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyNotification {
  static MyNotification? _instance;

  MyNotification._internal() {
    _instance = this;
  }

  factory MyNotification() => _instance ?? MyNotification._internal();

  Future<void> initializeNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse detail) async {
        final payload = detail.payload;
        if (payload != null) {
          print('Payload diterima: $payload');
        }
      },
    );
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      '0',
      'channel_name', // Nama channel
      channelDescription: 'Deskripsi channel',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi
      'Judul Notifikasi', // Judul
      'Isi Notifikasi', // Isi
      platformDetails,
      payload: 'Data tambahan', // Data payload (opsional)
    );
  }
}
