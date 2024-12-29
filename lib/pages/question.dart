import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/kada%20dipakai%20tapi%20jangan%20dibuang/custom_scaffold.dart';
import 'package:ngoding_cuy/provider/course_activity.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = "/test";
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String? jawaban;
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
                  leading: Radio(
                    value: question[i].choices[index].text,
                    groupValue: jawaban,
                    onChanged: (String? value) {
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
                      print("Gak bisa $i");
                      if (question.length - 1 != i) {
                        print("Tambah $i");
                        setState(() {
                          i += 1;
                        });
                      } else {
                        Navigator.pop(context);
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
