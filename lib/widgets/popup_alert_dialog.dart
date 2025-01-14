import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:ngoding_cuy/provider/user_data.dart';
import 'package:provider/provider.dart';

class MyPopUp extends StatefulWidget {
  final CourseName course;
  const MyPopUp({super.key, required this.course});

  @override
  State<MyPopUp> createState() => _MyPopUpState();
}

class _MyPopUpState extends State<MyPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                child: Image.network(widget.course.image,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      widget.course.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.course.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            //
            // action 2
            //
            TextButton(
              onPressed: () {
                Provider.of<CourseAppActifity>(context, listen: false)
                    .upDateSelectingCourseData(
                        widget.course.id); // mengubah selected jadi true
                Provider.of<Userdata>(context, listen: false)
                    .setCourseIds(widget.course.id);

                Provider.of<CourseAppActifity>(context, listen: false)
                    .setCourseNameState(
                        widget.course); // menyimpan course yang terakhir
                //                              kali diakses
                Navigator.pop(context); // menghilangkan Popup
              },
              child: const Text("Pilih"),
            ),
          ],
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
