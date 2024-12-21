import 'package:flutter/material.dart';
import 'package:ngoding_cuy/common/style.dart';
import 'package:ngoding_cuy/widgets/catalog.dart';
import 'package:ngoding_cuy/widgets/grid_tile.dart';

class ListPage extends StatelessWidget {
  static const routeName = "/list";
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const MyCatalog();
              },
              itemCount: 9,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Latihan",
              style: headLine,
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
              return const MyGridTile();
            },
          ),
        ],
      ),
    );
  }
}
