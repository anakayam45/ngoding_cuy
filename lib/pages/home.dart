import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/list.dart';
import 'package:ngoding_cuy/pages/test.dart';

import '../widgets/platform.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const ListPage(),
    const TestPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _pageIcon = [
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

  void _onClick(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _pageIcon,
      ),
      tabBuilder: (BuildContext context, int index) {
        return _pages[index];
      },
    );
  }

  Widget _buildAndro(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _pageIcon,
        onTap: _onClick,
        currentIndex: _pageIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndro,
      iosBuilder: _buildIos,
    );
  }
}
