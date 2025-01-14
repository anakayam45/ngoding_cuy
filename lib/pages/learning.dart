import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/widget_for_learning_page.dart';
import 'package:provider/provider.dart';
import '../provider/course_activity.dart';

class LearningPage extends StatefulWidget {
  static const routeName = "/learning";
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    final material = Provider.of<CourseAppActifity>(context).materialNamestate;

    if (material == null || material.materialContent.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            "No material available.",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    final content = material.materialContent;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          material.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return seleksi(context, content[index]);
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
                  child: content.length != i
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              i += 1;
                            });
                          },
                          child: const Text("Load More"),
                        )
                      : buttonToTest(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
