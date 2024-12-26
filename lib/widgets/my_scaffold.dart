import 'package:flutter/material.dart';
import 'package:ngoding_cuy/common/style.dart';

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
    return MaterialApp(
      theme: MyAppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        backgroundColor: const Color(0xFFBEC3C4),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: body,
        ),
      ),
    );
  }
}
