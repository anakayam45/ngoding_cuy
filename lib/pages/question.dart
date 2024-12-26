import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/custom_scaffold.dart';

class TestPage extends StatefulWidget {
  static const routeName = "/test";
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
