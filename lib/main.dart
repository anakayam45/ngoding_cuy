import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ngoding_cuy/common/my_theme_app.dart';
import 'package:ngoding_cuy/pages/news_page.dart';
import 'pages/learning.dart';
import 'pages/selection_page.dart';
import 'pages/starting.dart';
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
        QuestionPage.routeName: (context) => const QuestionPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        SelectedCoursePage.routeName: (context) => const SelectedCoursePage(),
        LearningPage.routeName: (context) => const LearningPage(),
        MyNewspage.routename: (context) => const MyNewspage(),
      },
    );
  }
}
