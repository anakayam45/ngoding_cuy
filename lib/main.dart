import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ngoding_cuy/common/my_theme_app.dart';
import 'pages/material_content_name.dart';
import 'pages/selection_course.dart';
import 'pages/starting.dart';
import 'pages/learning.dart';
import 'pages/profile_setting.dart';
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
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName: (context) => const LandingPage(),
        HomePage.routeName: (context) => const HomePage(),
        LearingPage.routeName: (context) => const LearingPage(),
        QuestionPage.routeName: (context) => const QuestionPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        SelectedCoursePage.routeName: (context) => const SelectedCoursePage(),
        MaterialContentName.routeName: (context) => const MaterialContentName()
      },
    );
  }
}
