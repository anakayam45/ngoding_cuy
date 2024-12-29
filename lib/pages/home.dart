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
    //
    //
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          //
          SizedBox(
            height: 200,
            child: ListView.builder(
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
            child: Text(
              "Latihan",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          //
          //
          //
          GridView.builder(
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
