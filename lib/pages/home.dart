import 'package:flutter/material.dart';

import 'package:ngoding_cuy/widgets/course_grid_tile.dart';
import 'package:ngoding_cuy/widgets/custom_scaffold.dart';
import 'package:ngoding_cuy/widgets/news_list_tile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        title: "Ngoding Cuy",
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const MyNewsCatalog();
                  },
                  itemCount: 3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Latihan",
                ),
              ),
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
                  return const MyCourse();
                },
              ),
            ],
          ),
        ));
  }
}
