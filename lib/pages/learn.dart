import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  static const routeName = "/learn";
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali"))));
  }
}
