import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:ngoding_cuy/pages/start_page.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/profile.dart';
import 'package:ngoding_cuy/pages/test.dart';
import 'package:ngoding_cuy/provider/course_provider.dart';
import 'package:ngoding_cuy/provider/scheduled_provider.dart';
import 'package:ngoding_cuy/utils/background_service.dart';
import 'package:ngoding_cuy/utils/notification.dart';
import 'pages/home_page.dart';
import 'provider/datetime_provider.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // memasitikan inisiasi selesai

  final MyNotification myNotification = MyNotification();
  myNotification.initializeNotifications(
      flutterLocalNotificationsPlugin); // insiasi material notifikasi

  final BackgroundService service =
      BackgroundService(); // inisiasi aktifitas di belakang layar, port
  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  runApp(
    MultiProvider(
      // menggunakan multiprovider
      providers: [
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartPage.routeName,
      routes: {
        StartPage.routeName: (context) =>
            const StartPage(), // pengaturan tipe perangkat
        HomePage.routeName: (context) => const HomePage(), // layar utama
        LearnPage.routeName: (context) => const LearnPage(), // Layar materi
        TestPage.routeName: (context) => const TestPage(), // Quiz
        ProfilePage.routeName: (context) =>
            const ProfilePage(), // menu setting dan profile
      },
    );
  }
}
