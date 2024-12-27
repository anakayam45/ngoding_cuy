import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:ngoding_cuy/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseName> selectedCourseName =
        Provider.of<CourseProvider>(context).getSelectedCourse();
    return MyScaffold(
      title: "My Learning path",
      body: ListView.builder(
        itemCount: selectedCourseName.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedCourseName[index].name),
          );
        },
      ),
    );
  }
}
