import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/material_content_name.dart';
import 'package:provider/provider.dart';
import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';

class SelectedCoursePage extends StatelessWidget {
  static const routeName = "/selectionCourse";
  const SelectedCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
//
//
    List<CourseName> selectedCourseName =
        Provider.of<CourseAppActifity>(context).getSelectedCourseData();
//
//
    return ListView.builder(
//
      itemCount: selectedCourseName.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey(selectedCourseName[index].id),
          title: Text(selectedCourseName[index].name),
          onTap: () {
            //
            Provider.of<CourseAppActifity>(context, listen: false)
                .setCourseNameState(selectedCourseName[index]); // menyimpan
            // course yang di akses

            Navigator.of(context).pushNamed(MaterialContentName.routeName);
          },
        );
      },
    );
  }
}
