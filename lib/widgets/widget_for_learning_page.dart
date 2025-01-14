import 'package:flutter/material.dart';

import '../data/model/materi_ngoding_cuy.dart';

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
  return Container(
    decoration: const BoxDecoration(
        color: Colors.amber,
        border: Border.symmetric(
            vertical:
                BorderSide(color: Color.fromARGB(255, 42, 41, 41), width: 2))),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        content!.content,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    ),
  );
}

Widget myParagraph(BuildContext context, ModuleContent? content) {
  return Text(content!.content, style: Theme.of(context).textTheme.labelSmall);
}

Widget imageFromNetwork(BuildContext context, ModuleContent? content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Image.network(
      content!.content,
      width: MediaQuery.of(context).size.width - 50,
      errorBuilder: (context, error, stackTrace) {
        print(content.content);
        return const Center(
          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
        );
      },
    ),
  );
}
