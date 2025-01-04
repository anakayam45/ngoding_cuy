import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/service_api.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/pages/home.dart';
import 'package:ngoding_cuy/pages/selection_page.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

import '../utils/platform_case.dart';
import '../widgets/warning.dart';
import 'profile_setting.dart';

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

  late Future<NgodingCuy> ngoding;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    ngoding = ApiService().availableCourse();
  }

  void onClick(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: pageIcon,
        currentIndex: pageIndex,
        onTap: onClick,
      ),
      tabBuilder: (BuildContext context, int index) {
        return pages[index];
      },
    );
  }

  Widget buildAndro(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(["Ngoding cuy", "My learning path", "Profile"][pageIndex]),
        shadowColor: Colors.black,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: pageIcon,
        onTap: onClick,
        currentIndex: pageIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NgodingCuy>(
      future: ngoding,
      builder: (context, AsyncSnapshot<NgodingCuy> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Material(
                color: Colors.grey,
                child: WarningPopUp(
                    title: snapshot.error.toString(),
                    onPressed: () => Restart.restartApp(
                          notificationTitle: "Restart Aja Bang",
                          notificationBody: "Lorem Ipsum Dolorsit amet!",
                        )),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<CourseAppActifity>(context, listen: false)
                    .addCourse(snapshot.data!);
              });
              return PlatformWidget(
                androidBuilder: buildAndro,
                iosBuilder: buildIos,
              );
            }
            return WarningPopUp(
                title: "Data tidak ada",
                onPressed: () => Restart.restartApp(
                      notificationTitle: "Restart Aja Bang",
                      notificationBody: "Lorem Ipsum Dolorsit amet!",
                    ));
          default:
            return const WarningPopUp(
              title: "Data tidak ada",
            );
        }
      },
    );
  }
}
