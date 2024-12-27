import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';
import 'package:ngoding_cuy/widgets/popup_alert_dialog.dart';
import 'package:ngoding_cuy/widgets/effect.dart';

class MyCourse extends StatelessWidget {
  final CourseName course;
  const MyCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => const MyPopUp());
      },
      child: Container(
        margin: const EdgeInsets.all(8.0), // Jarak antar item di grid
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white,
            width: 2.5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          boxShadow: [
            myShaddow(),
          ],
        ),
        child: GridTile(
          // Header Image
          header: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Container(
              height: 70,
              color: const Color(0xFFBEC3C4),
              child: Image.network(
                course.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print(course.image);
                  return const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          // Main Content
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Positioned(
                  top: 80,
                  left: 10,
                  child: Text(
                    course.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    course.duration,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
