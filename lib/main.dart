import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'pages/starting.dart';
import 'pages/learning.dart';
import 'pages/profile.dart';
import 'pages/question.dart';
import 'pages/home.dart';
import 'provider/center_provider_config.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  mainProvider(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartPage.routeName,
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        HomePage.routeName: (context) => const HomePage(),
        LearnPage.routeName: (context) => const LearnPage(),
        TestPage.routeName: (context) => const TestPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
