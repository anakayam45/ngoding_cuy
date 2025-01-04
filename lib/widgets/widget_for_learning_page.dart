import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/question.dart';

import '../data/model/materi_from_api.dart';

Widget seleksi(BuildContext context, ModuleContent content) {
  print(content.type);
  switch (content.type) {
    case "head":
      return myHeading(
        context,
        content,
      );

    case "text":
      return myParagraph(
        context,
        content,
      );

    case "image":
      return imageFromNetwork(
        context,
        content,
      );

    default:
      return myHeading(
        context,
        content,
      );
  }
}

Widget myHeading(BuildContext context, ModuleContent? content) {
  return Text(
    content!.content,
    style: Theme.of(context).textTheme.displayLarge,
  );
}

Widget myParagraph(BuildContext context, ModuleContent? content) {
  return Text(
    content!.content,
    style: const TextStyle(color: Colors.black),
  );
}

Widget imageFromNetwork(BuildContext context, ModuleContent? content) {
  return Image.network(
    content!.content,
    width: MediaQuery.of(context).size.width - 50,
    errorBuilder: (context, error, stackTrace) {
      print(content.content);
      return const Center(
        child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
      );
    },
  );
}

Widget buttonToTest(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, QuestionPage.routeName);
      },
      child: const Text("Kerjakan Soal"));
}
