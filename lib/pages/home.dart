import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/news_page.dart';

import 'package:ngoding_cuy/widgets/news_list_tile.dart';
import 'package:provider/provider.dart';

import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';
import '../widgets/course_grid_tile.dart';

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
        Provider.of<CourseAppActifity>(context, listen: true).getCourseName();
    //
    //

    if (coursename.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final List<News> news =
          Provider.of<CourseAppActifity>(context, listen: false).getNewsData;
      print(news.isEmpty);
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Berita",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
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
                        return GestureDetector(
                          onTap: () {
                            Provider.of<CourseAppActifity>(context,
                                    listen: false)
                                .setNewsContent(news[index]);
                            Navigator.pushNamed(context, MyNewspage.routename);
                          },
                          child: MyNewsCatalog(
                            news: news[index],
                          ),
                        );
                      },
                      itemCount: news.length,
                    ),
            ),
            //
            //
            //
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
                : Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "Latihan",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 150,
                          ),
                          itemCount: coursename.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: MyCourse(
                              course: coursename[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            //
            //
            //
          ],
        ),
      );
    }
  }
}
