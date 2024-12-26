import 'package:flutter/material.dart';

class MyNewsCatalog extends StatelessWidget {
  const MyNewsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Image.asset(
                "lib/images/freya1.jpg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 14, 178, 200)
                          .withOpacity(0.1),
                      offset: const Offset(5, 5),
                      blurRadius: 8,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.2, 1.1]),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Judul Berita",
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(
                        "Lorem impsum dolor sit amet .....",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}