import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/widget_for_learning_page.dart';
import 'package:provider/provider.dart';

import '../data/model/materi_from_api.dart';
import '../provider/course_activity.dart';

class LearingPage extends StatefulWidget {
  static const routeName = "/learning";
  const LearingPage({super.key});

  @override
  State<LearingPage> createState() => _LearingPageState();
}

class _LearingPageState extends State<LearingPage> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    Module? materialContent =
        Provider.of<CourseAppActifity>(context).materialNamestate;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          materialContent!.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ListView.builder(
                  itemBuilder: (contex, index) {
                    return seleksi(materialContent.materialContent[index]);
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
                    if (materialContent.materialContent.length != i) {
                      setState(() {
                        i += 1;
                      });
                    }
                  },
                  child: const Text("data"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
