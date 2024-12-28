import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/learning.dart';
import 'package:provider/provider.dart';

import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';

class MaterialContentName extends StatelessWidget {
  static String routeName = "/myMaterialContentName";
  const MaterialContentName({super.key});

  @override
  Widget build(BuildContext context) {
    List<Module> selectedCourseName =
        Provider.of<CourseAppActifity>(context).getCourseContent();
    CourseName? course = Provider.of<CourseAppActifity>(context).coursestate;
    return Scaffold(
      appBar: AppBar(
        title: Text(course!.name),
      ),
      body: ListView.builder(
        itemCount: selectedCourseName.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: ValueKey(selectedCourseName[index].id),
            title: Text(selectedCourseName[index].title),
            onTap: () {
              Provider.of<CourseAppActifity>(context, listen: false)
                  .setMaterialContent(selectedCourseName[index]);
              Navigator.of(context).pushNamed(LearningPage.routeName);
            },
          );
        },
      ),
    );
  }
}
