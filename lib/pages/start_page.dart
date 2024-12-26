import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/api.dart';
import 'package:ngoding_cuy/data/model/materi.dart';
import 'package:ngoding_cuy/pages/learn.dart';
import 'package:ngoding_cuy/pages/home_page.dart';
import 'package:ngoding_cuy/provider/course_provider.dart';
import 'package:provider/provider.dart';

import '../utils/platform.dart';
import 'profile.dart';

class StartPage extends StatefulWidget {
  static const routeName = "/";
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<Widget> pages = [
    const HomePage(),
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

  int pageIndex = 0;
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
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: pageIcon,
        onTap: onClick,
        currentIndex: pageIndex,
      ),
    );
  }

  late final Future<NgodingCuy> _ngoding;

  @override
  void initState() {
    super.initState();
    _ngoding = ApiService().availableCourse();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NgodingCuy>(
      future: _ngoding,
      builder: (context, AsyncSnapshot<NgodingCuy> snapshot) {
        var state = snapshot.connectionState;

        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Material(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<CourseProvider>(context, listen: false)
                .addCourse(snapshot.data!);
          });

          return PlatformWidget(
            androidBuilder: buildAndro,
            iosBuilder: buildIos,
          );
        } else {
          return const Center(
            child: Text("Tidak ada data tersedia."),
          );
        }
      },
    );
  }
}
