import 'package:flutter/material.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          color: const Color.fromARGB(255, 141, 135, 117),
          child: Stack(
            children: [
              Image.network(
                "url",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.image, size: 50));
                },
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  "Judul Berita",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
