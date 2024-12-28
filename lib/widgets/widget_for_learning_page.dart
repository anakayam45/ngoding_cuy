import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/question.dart';

import '../data/model/materi_from_api.dart';

Widget seleksi(ModuleContent content) {
  switch (content.type) {
    case "head":
      return MyHeading(
        content: content,
      );

    case "text":
      return MyParagraph(
        content: content,
      );

    case "image":
      return ImageFromNetwork(
        content: content,
      );

    default:
      return const ButtonToTest();
  }
}

class MyHeading extends StatelessWidget {
  final ModuleContent? content;
  const MyHeading({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content!.content,
      style: const TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
    );
  }
}

class MyParagraph extends StatelessWidget {
  final ModuleContent? content;
  const MyParagraph({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content!.content,
      style: const TextStyle(color: Colors.black),
    );
  }
}

class ImageFromNetwork extends StatelessWidget {
  final ModuleContent? content;
  const ImageFromNetwork({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      content!.content,
      width: MediaQuery.of(context).size.width - 50,
      errorBuilder: (context, error, stackTrace) {
        print(content!.content);
        return const Center(
          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
        );
      },
    );
  }
}

class ButtonToTest extends StatelessWidget {
  const ButtonToTest({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, QuestionPage.routeName);
        },
        child: const Text("Kerjakan Soal"));
  }
}
