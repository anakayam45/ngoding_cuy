import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  const MyScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF1DCFF8),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: body,
      ),
    );
  }
}
