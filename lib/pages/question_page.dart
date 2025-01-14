import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_ngoding_cuy.dart';
import 'package:ngoding_cuy/kada%20dipakai%20tapi%20jangan%20dibuang/custom_scaffold.dart';
import 'package:ngoding_cuy/widgets/warning_pop_up.dart';
import 'package:provider/provider.dart';

import '../jamal.dart';
import '../provider/course_activity.dart';
import '../provider/user_data.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = "/test";
  const QuestionPage({super.key});

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
    return MyScaffold(
      title: "Soal",
      body: Center(
        child: question!.isEmpty
            ? const Center(
                child: Text("No Question Available"),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // pertanyaan
                    question[i].questionText,
                    style: const TextStyle(color: Colors.black),
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
                      // tombol kembali
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Kembali")),
                      const SizedBox(width: 10),
                      // tombol kirim
                      ElevatedButton(
                          onPressed: () {
                            // jawaban benar
                            if (question[i].choices[jawaban!].isCorrect) {
                              // jika soal belum habis
                              if (question.length - 1 != i) {
                                showDialog(
                                    context: context,
                                    builder: (context) => WarningPopUp(
                                          title: "Benar",
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ));
                                // lanjut ke soal berikutnya
                                setState(() async {
                                  jawaban = 5;
                                  i += 1;
                                });
                              } else {
                                //
                                CourseName? course =
                                    Provider.of<CourseAppActifity>(context)
                                        .courseNameState;
                                //
                                Module? material =
                                    Provider.of<CourseAppActifity>(context)
                                        .materialNamestate;
                                //
                                Provider.of<Userdata>(context, listen: false)
                                    .setCourseIds(course!.id, material!.id);
                                //
                                showDialog(
                                    context: context,
                                    builder: (context) => const WarningPopUp(
                                          title: "Soal sudah selesai",
                                          color: Colors.red,
                                        ));
                              }

                              // menyimpan score
                              Provider.of<Userdata>(context)
                                  .setScore(question[i].id);
                              List<String>? scores =
                                  Provider.of<Userdata>(context).score;
                              prefs!.setStringList("scores", scores!);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => const WarningPopUp(
                                        title: "Salah",
                                      ));
                            }
                          },
                          child: const Text("Kirim"))
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
