import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/home_page.dart';

import '../utils/platform.dart';
import 'profile.dart';

class StartPage extends StatefulWidget {
  static const routeName = "/";
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int pageIndex = 0;

  final List<Widget> pages = [
    // layar yang digunakan
    const HomePage(),
    const LearnPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> pageIcon = [
    // item di Navbar di bawah layar
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
        label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.quote_bubble : Icons.task),
        label: "Task"),
    BottomNavigationBarItem(
        icon: Icon(
            Platform.isIOS ? CupertinoIcons.profile_circled : Icons.person),
        label: "profile"),
  ];

  void onClick(int index) {
    // action untuk memindahkan layar
    setState(() {
      pageIndex = index;
    });
  }

  Widget buildIos(BuildContext context) {
    // layar untuk IOS
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: pageIcon,
      ),
      tabBuilder: (BuildContext context, int index) {
        return pages[index];
      },
    );
  }

  Widget buildAndro(BuildContext context) {
    // layar untuk Android
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: pageIcon,
        onTap: onClick,
        currentIndex: pageIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // klasifikasi perangkat android atau ios
    return PlatformWidget(
      androidBuilder: buildAndro,
      iosBuilder: buildIos,
    );
  }
}
