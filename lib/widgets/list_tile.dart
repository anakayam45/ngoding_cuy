import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String url;
  final void onclick;
  const MyListTile(
      {super.key,
      required this.title,
      required this.onclick,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 255, 255, 255),
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 70,
            height: 70,
            color: const Color.fromARGB(255, 227, 227, 227),
            child: Image.network(
              url,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 30);
              },
            ),
          ),
        ),
        title: const Text(
          "Hello world",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Ini sub title",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        onTap: () {
          null;
        },
      ),
    );
  }
}
