import 'package:flutter/material.dart';
import 'package:ngoding_cuy/pages/test.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, TestPage.routeName),
      child: GridTile(
        footer: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Hello world"),
        ),
        header: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            height: 70,
            child: const Center(
              child: Icon(
                Icons.image,
                size: 50,
              ),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
