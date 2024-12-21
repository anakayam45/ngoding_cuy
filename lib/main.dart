import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ngoding_cuy/pages/home.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/profile.dart';
import 'package:ngoding_cuy/pages/test.dart';
import 'package:ngoding_cuy/utils/notification.dart';
import 'pages/list.dart';
import 'provider/datetime_provider.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // memasitikan inisiasi

  final MyNotification myNotification = MyNotification();
  myNotification.initializeNotifications(flutterLocalNotificationsPlugin);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimeProvider()),
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ListPage.routeName: (context) => const ListPage(),
        LearnPage.routeName: (context) => const LearnPage(),
        TestPage.routeName: (context) => const TestPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
