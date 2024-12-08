import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/home.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/profile.dart';
import 'package:ngoding_cuy/pages/test.dart';
import 'pages/list.dart';

void main() => runApp(const MyApp());

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
