import 'package:flutter/material.dart';
import 'package:ngoding_cuy/common/style.dart';
import 'package:ngoding_cuy/widgets/course_grid.dart';
import 'package:ngoding_cuy/widgets/my_scaffold.dart';
import 'package:ngoding_cuy/widgets/news_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        title: "Ngoding Cuy",
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // item 1
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const MyNewsCatalog(); // widget untuk berita developer atau pemberitahuan sistem
                  },
                  itemCount: 3,
                ),
              ),

              // item 2
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Latihan",
                  style: headLine,
                ),
              ),

              // item 3
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 150),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return const MyCourse(); // grid menu course
                },
              ),
            ],
          ),
        ));
  }
}
