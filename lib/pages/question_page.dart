import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_ngoding_cuy.dart';
import 'package:provider/provider.dart';

import '../jamal.dart';
import '../provider/course_activity.dart';
import '../provider/user_data.dart';
import '../widgets/warning_pop_up.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = "/test";
  const QuestionPage(BuildContext context, {super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int? jawaban;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    List<Question>? question =
        Provider.of<CourseAppActifity>(context).questionstate;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Soal"),
          backgroundColor: const Color(0xFF1DCFF8),
        ),
        backgroundColor: Colors.grey[200],
        body: question == null || question.isEmpty
            ? const Center(
                child: Text("No Question Available"),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        question[i].questionText,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: question[i].choices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Radio<int>(
                            value: index,
                            groupValue: jawaban,
                            onChanged: (value) {
                              setState(() {
                                jawaban = value;
                              });
                            },
                          ),
                          title: Text(question[i].choices[index].text),
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("kembali")),
                        TextButton(
                            onPressed: () {
                              CourseName? course =
                                  Provider.of<CourseAppActifity>(context)
                                      .courseNameState;
                              Module? material =
                                  Provider.of<CourseAppActifity>(context)
                                      .materialNamestate;
                              if (jawaban == null) {
                                showDialog(
                                  context: context,
                                  builder: (context) => const WarningPopUp(
                                    title: "Pilih jawaban terlebih dahulu",
                                    color: Colors.red,
                                  ),
                                );
                                return;
                              }

                              if (question[i].choices[jawaban!].isCorrect) {
                                if (i >= question.length - 1) {
                                  Provider.of<Userdata>(context, listen: false)
                                      .setCourseIds(course!.id, material!.id);
                                  showDialog(
                                    context: context,
                                    builder: (context) => WarningPopUp(
                                      title: "Benar",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                  setState(() {
                                    jawaban = null;
                                    i += 1;
                                  });
                                } else {
                                  Provider.of<Userdata>(context, listen: false)
                                      .setCourseIds(course!.id, material!.id);

                                  Navigator.pop(context);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => const WarningPopUp(
                                  //     title: "Soal sudah selesai",
                                  //     color: Colors.red,
                                  //   ),
                                  // );
                                }

                                Provider.of<Userdata>(context)
                                    .setScore(question[i].id);
                                List<String>? scores =
                                    Provider.of<Userdata>(context).score;
                                if (scores != null) {
                                  prefs?.setStringList("scores", scores);
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => const WarningPopUp(
                                    title: "Salah",
                                  ),
                                );
                              }
                            },
                            child: const Text("Enter"))
                      ],
                    ),
                  ],
                ),
              ));
  }
}
