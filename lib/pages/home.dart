import 'package:flutter/material.dart';

import 'package:ngoding_cuy/widgets/course_grid_tile.dart';
import 'package:ngoding_cuy/widgets/news_list_tile.dart';
import 'package:provider/provider.dart';

import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //
    //
    final List<CourseName> coursename =
        Provider.of<CourseAppActifity>(context).getCourseName();
    final List<News> news =
        Provider.of<CourseAppActifity>(context).getNewsData();
    print(news.isEmpty);
    //
    //
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Berita",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black)),
          ),
          //
          //
          SizedBox(
            height: 200,
            child: news.isEmpty
                ? const Center(
                    child: Text(
                      "Tidak ada Berita",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MyNewsCatalog(
                        news: news[index],
                      );
                    },
                    itemCount: news.length,
                  ),
          ),
          //
          //
          //
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Latihan",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black)),
          ),
          //
          //
          //
          coursename.isEmpty
              ? const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      "Belum ada latihan",
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 150),
                  itemCount: coursename.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyCourse(
                      course: coursename[index],
                    );
                  },
                ),
          //
          //
        ],
      ),
    );
  }
}
