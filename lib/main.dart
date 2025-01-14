import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ngoding_cuy/common/my_theme_app.dart';
import 'package:ngoding_cuy/pages/news_page.dart';
import 'package:ngoding_cuy/provider/user_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/learning.dart';
import 'pages/login.dart';
import 'pages/selection_page.dart';
import 'pages/starting.dart';
import 'pages/profile_setting.dart';
import 'pages/question.dart';
import 'pages/home.dart';
import 'provider/provider_config.dart';
import 'utils/background_service.dart';
import 'utils/notification_settings.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

SharedPreferences? prefs;
String? name;
List<String>? scores;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // notification
  final MyNotification myNotification = MyNotification();
  myNotification.initializeNotifications(flutterLocalNotificationsPlugin);

  // background service
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  // userdata
  prefs = await SharedPreferences.getInstance();
  name = prefs!.getString("username") ?? "";
  scores = prefs!.getStringList("user") ?? [];

  mainProvider(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Userdata>(context).setName(name!);
    for (var score in scores!) {
      Provider.of<Userdata>(context).setScore(score);
    }

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
        MyLoginPage.routeName: (context) => const MyLoginPage()
      },
    );
  }
}
