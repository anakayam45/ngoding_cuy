import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/popup.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => const MyPopUp());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 2)),
        child: GridTile(
          footer: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hello world",
            ),
          ),
          header: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                color: const Color(0xFFBEC3C4),
                height: 70,
                child: Image.asset("lib/images/img01.png", fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                })),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
