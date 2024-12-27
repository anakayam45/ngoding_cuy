import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/service.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/pages/learning.dart';
import 'package:ngoding_cuy/pages/home.dart';
import 'package:ngoding_cuy/provider/add_course.dart';
import 'package:provider/provider.dart';

import '../utils/platform_case.dart';
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

  final Map<String, Icon> pageIcons = {
    'Home': Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
    'Learn': Icon(Platform.isIOS ? CupertinoIcons.quote_bubble : Icons.task),
    'Profile':
        Icon(Platform.isIOS ? CupertinoIcons.profile_circled : Icons.person),
  };

  late List<BottomNavigationBarItem> pageIcon;
  late final Future<NgodingCuy> ngoding;

  @override
  void initState() {
    super.initState();
    ngoding = ApiService().availableCourse();
    pageIcon = pageIcons.entries
        .map(
          (entry) => BottomNavigationBarItem(
            icon: entry.value,
            label: entry.key,
          ),
        )
        .toList();
  }

  int pageIndex = 0;
  void onClick(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: pageIcon),
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NgodingCuy>(
      future: ngoding,
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
