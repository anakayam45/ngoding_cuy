import 'package:flutter/material.dart';
import 'package:ngoding_cuy/provider/user_data.dart';
import '../data/model/materi_ngoding_cuy.dart';
import 'package:provider/provider.dart';
import '../provider/course_activity.dart';
import '../widgets/costum_loading.dart';
import 'learning_page.dart';

class SelectedCoursePage extends StatefulWidget {
  static const routeName = "/selectionCourse";
  const SelectedCoursePage({super.key});

  @override
  State<SelectedCoursePage> createState() => _SelectedCoursePageState();
}

class _SelectedCoursePageState extends State<SelectedCoursePage> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<CourseName> courseName =
        Provider.of<CourseAppActifity>(context).getSelectedCourseData;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: courseName.isEmpty
          ? const Center(
              child: Text(
                "Belum ada latihan yang dipilih",
                style: TextStyle(color: Colors.black),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListView.separated(
                itemCount: courseName.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  // seluruh sub bab yang tersedia
                  List<Module> courseContent =
                      Provider.of<CourseAppActifity>(context)
                          .getCourseContent();
                  // sub bab yang sudah diselesaikan
                  Set<String> courseIds =
                      Provider.of<Userdata>(context).courseIds ??
                          {}[courseName[index].id] ??
                          <String>{};
                  // skor dari sub bab
                  double step = courseIds.length / courseContent.length * 100;
                  // //
                  final isExpanded = expandedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CourseAppActifity>(context, listen: false)
                          .setCourseNameState(courseName[index]);
                      setState(() {
                        expandedIndex = isExpanded ? null : index;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * .9,
                          height: screenHeight * .12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[400],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            courseName[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * .5,
                                          child: Text(
                                            courseName[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyBarProgresor(
                                  step: step.toInt(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          width: screenWidth * .8,
                          height: isExpanded
                              ? screenHeight * .1 * (courseContent.length / 1.5)
                              : 0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            color: Color.fromARGB(255, 236, 235, 235),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: AnimatedOpacity(
                            opacity: isExpanded ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: ListView.builder(
                              itemCount: courseContent.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder:
                                  (BuildContext context, int subIndex) {
                                return ListTile(
                                  trailing: const Icon(Icons.play_arrow),
                                  title: Text(courseContent[subIndex].title),
                                  onTap: () {
                                    Provider.of<CourseAppActifity>(context,
                                            listen: false)
                                        .setMaterialContent(
                                            courseContent[subIndex]);
                                    Navigator.of(context)
                                        .pushNamed(LearningPage.routeName);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
