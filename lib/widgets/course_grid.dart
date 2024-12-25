import 'package:flutter/material.dart';
import 'package:ngoding_cuy/common/style.dart';
import 'package:ngoding_cuy/widgets/popup.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => const MyPopUp());
      },
      child: GridTile(
        footer: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Hello world",
            style: headLine,
          ),
        ),
        header: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              color: Colors.white,
              height: 70,
              child: Image.asset(
                "lib/images/img01.png",
                fit: BoxFit.cover,
              )),
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
