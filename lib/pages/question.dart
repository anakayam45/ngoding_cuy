import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/kada%20dipakai%20tapi%20jangan%20dibuang/custom_scaffold.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:ngoding_cuy/widgets/wrong_correct_popup.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question![i].questionText,
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
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kembali")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      if (question[i].choices[jawaban!].isCorrect) {
                        if (question.length - 1 != i) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const WrongOrCorrect(
                                  action: true,
                                );
                              });
                          setState(() {
                            jawaban = 5;
                            i += 1;
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const WrongOrCorrect(
                                action: false,
                              );
                            });
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
