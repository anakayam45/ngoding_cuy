import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/material_content.dart';
import 'package:provider/provider.dart';
import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';

class CoursePage extends StatelessWidget {
  static const routeName = "/selectionCourse";
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseName> selectedCourseName =
        Provider.of<CourseAppActifity>(context).getSelectedCourse();
    return ListView.builder(
      itemCount: selectedCourseName.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey(selectedCourseName[index].id),
          title: Text(selectedCourseName[index].name),
          onTap: () {
            Provider.of<CourseAppActifity>(context, listen: false)
                .setCourseState(selectedCourseName[index]); // menyimpan
            // course yang terakhir kali di akses

            Navigator.of(context).pushNamed(MaterialsContent.routeName);
          },
        );
      },
    );
  }
}
