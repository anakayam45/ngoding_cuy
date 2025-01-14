import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_ngoding_cuy.dart';
import 'package:provider/provider.dart';

import '../provider/course_activity.dart';

class MyNewspage extends StatelessWidget {
  static String routename = "/newsPage";
  const MyNewspage({super.key});

  @override
  Widget build(BuildContext context) {
    News? news = Provider.of<CourseAppActifity>(context).newsSate;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              news!.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.description,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
