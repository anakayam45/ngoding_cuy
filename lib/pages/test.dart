import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  static const routeName = "/test";
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Quiz"),
    );
  }
}
