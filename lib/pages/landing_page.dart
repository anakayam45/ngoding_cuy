import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/service_api.dart';
import 'package:ngoding_cuy/data/model/materi_ngoding_cuy.dart';
import 'package:ngoding_cuy/pages/home_page.dart';
import 'package:ngoding_cuy/pages/selected_course_page.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/course_activity.dart';
import '../provider/user_data.dart';
import '../utils/platform_case.dart';
import '../widgets/warning_pop_up.dart';
import 'profile_and_setting.dart';

List<String>? courseIds;

class LandingPage extends StatefulWidget {
  static const routeName = "/";
  const LandingPage(BuildContext context, {super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> pages(context) => [
        HomePage(context),
        SelectedCoursePage(context),
        ProfilePage(context),
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

  AppBar buildHomeAppBar(String name, int myScore) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 180,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.blue,
                size: 28,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.diamond_outlined,
            color: Color(0xFFFFD700),
            size: 26,
          ),
          const SizedBox(width: 8),
          Text(
            myScore.toString(),
            style: const TextStyle(
              color: Color(0xFFFFD700),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: pageIcon,
        currentIndex: pageIndex,
        onTap: onClick,
      ),
      tabBuilder: (BuildContext context, int index) {
        return pages(context)[index];
      },
    );
  }

  Widget buildAndro(BuildContext context) {
    int? myScore = Provider.of<Userdata>(context).score?.toSet().length ?? 0;
    String? name = Provider.of<Userdata>(context).name ?? "Budi";
    List<AppBar> appBars = [
      buildHomeAppBar(name, myScore),
      AppBar(
        title: Text("My learning path",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      AppBar(
        title: Text("Settings",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1DCFF8),
      appBar: appBars[pageIndex],
      body: pages(context)[pageIndex],
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
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
          } else if (snapshot.hasData && snapshot.data != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              List<String>? courseIds = prefs.getStringList("courseId");
              if (context.mounted) {
                for (var id in courseIds ?? []) {
                  Provider.of<CourseAppActifity>(context)
                      .upDateSelectingCourseData(id);
                  // Provider.of<Userdata>(context, listen: false)
                  //     .setCourseIds(id);
                }
              }
            });
            Provider.of<CourseAppActifity>(context, listen: false)
                .addCourse(snapshot.data!);
            return PlatformWidget(
              androidBuilder: buildAndro,
              iosBuilder: buildIos,
            );
          } else {
            return WarningPopUp(
                title: "Data tidak ada",
                onPressed: () => Restart.restartApp(
                      notificationTitle: "Restart Aja Bang",
                      notificationBody: "Lorem Ipsum Dolorsit amet!",
                    ));
          }
        } else {
          return const WarningPopUp(
            title: "Data tidak ada",
          );
        }
      },
    );
  }
}
