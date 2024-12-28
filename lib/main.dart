import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ngoding_cuy/common/my_theme_app.dart';
import 'pages/material_content.dart';
import 'pages/selection_course.dart';
import 'pages/starting.dart';
import 'pages/learning.dart';
import 'pages/profile.dart';
import 'pages/question.dart';
import 'pages/home.dart';
import 'provider/provider_config.dart';
import 'utils/init.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  initBackgroundAndNotification();
  mainProvider(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyAppTheme.lightTheme,
      initialRoute: StartPage.routeName,
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        HomePage.routeName: (context) => const HomePage(),
        LearnPage.routeName: (context) => const LearnPage(),
        TestPage.routeName: (context) => const TestPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        CoursePage.routeName: (context) => const HomePage(),
        MaterialsContent.routeName: (context) => const MaterialsContent()
      },
    );
  }
}
