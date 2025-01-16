import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/my_login_page.dart';
import 'package:ngoding_cuy/pages/my_news_page.dart';

import 'package:ngoding_cuy/widgets/my_news_catalog.dart';
import 'package:provider/provider.dart';

import '../data/model/materi_ngoding_cuy.dart';
import '../provider/course_activity.dart';
import '../provider/user_data.dart';
import '../widgets/course_grid_tile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage(BuildContext context, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    //
    //
    final List<CourseName> coursename =
        Provider.of<CourseAppActifity>(context, listen: true).getCourseName();
    //

    // kalau belum login maka akan pindah ke login page
    final userData = Provider.of<Userdata>(context, listen: false).name;
    if (userData!.isEmpty) {
      Navigator.pushNamed(context, MyLoginPage.routeName);
    }

    // jika sudah maka lanjut render aplikasi

    if (coursename.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final List<News> news =
          Provider.of<CourseAppActifity>(context, listen: false).getNewsData;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child:
                  Text("Berita", style: Theme.of(context).textTheme.titleLarge),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
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
                              Navigator.pushNamed(
                                  context, MyNewspage.routename);
                            },
                            child: MyNewsCatalog(
                              context: context,
                              news: news[index],
                            ),
                          );
                        },
                        itemCount: news.length,
                      ),
              ),
            ),
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
                            child: CourseGridTile(
                              context: context,
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
