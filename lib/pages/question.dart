import 'package:flutter/material.dart';
import 'package:ngoding_cuy/trash/custom_scaffold.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = "/test";
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String? jawaban;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Soal",
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ini Pertanyaan?"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Radio(
                    value: "value",
                    groupValue: jawaban,
                    onChanged: (String? value) {
                      setState(() {
                        jawaban = value;
                      });
                    },
                  ),
                  title: const Text("ini Jawaban"),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Kembali")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("Kembali"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
