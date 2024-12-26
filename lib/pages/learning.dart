import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/custom_scaffold.dart';

class LearnPage extends StatefulWidget {
  static const routeName = "/learn";
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Belajar bang",
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ini Judul"),
            Flexible(
              child: ListView.builder(
                itemBuilder: (contex, index) {
                  return const Text("Hello world");
                },
                itemCount: i,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      i += 1;
                    });
                  },
                  child: const Text("data")),
            ),
          ),
        )
      ]),
    );
  }
}
