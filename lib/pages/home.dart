import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/list.dart';

import '../widgets/platform.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const ListPage(),
    const LearnPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> pageIcon = [
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
    setState(() {
      pageIndex = index;
    });
  }

  Widget buildIos(BuildContext context) {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 195, 196),
      appBar: AppBar(
        title: const Text("data"),
      ),
      body:
          SafeArea(minimum: const EdgeInsets.all(10), child: pages[pageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: pageIcon,
        onTap: onClick,
        currentIndex: pageIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: buildAndro,
      iosBuilder: buildIos,
    );
  }
}
