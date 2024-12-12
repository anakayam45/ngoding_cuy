import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/learn.dart';

class ListPage extends StatelessWidget {
  static const routeName = "/list";
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LearnPage.routeName);
              },
              child: const Text("klik untuk pergi ke learn page"))
        ],
      ),
    );
  }
}
