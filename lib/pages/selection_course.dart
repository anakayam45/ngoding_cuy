import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/custom_scaffold.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "My Learning path",
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile();
        },
      ),
    );
  }
}
