import 'package:flutter/material.dart';

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
    return SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Stack(children: [
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

// Scaffold(
//       backgroundColor: const Color.fromARGB(255, 190, 195, 196),
//       appBar: AppBar(
//         title: const Text("data"),
//       ),
//       body:
//           SafeArea(minimum: const EdgeInsets.all(10), child: pages[pageIndex]),
//       ),
//     );