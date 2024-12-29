import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/service_api.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/pages/home.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:provider/provider.dart';

import '../utils/platform_case.dart';
import 'profile_setting.dart';
import 'selection_course.dart';

class LandingPage extends StatefulWidget {
  static const routeName = "/";
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> pages = [
    const HomePage(),
    const SelectedCoursePage(),
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
        label: "Profile"),
  ];

  late final Future<NgodingCuy> ngoding;

  @override
  void initState() {
    super.initState();
    ngoding = ApiService().availableCourse();
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
      appBar: AppBar(
        title: Text(["Ngoding cuy", "My learning path", "Profile"][pageIndex]),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 228, 228),
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
            Provider.of<CourseAppActifity>(context, listen: false)
                .addCourse(snapshot.data);
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
