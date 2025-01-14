import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_ngoding_cuy.dart';

class MyNewsCatalog extends StatelessWidget {
  final News news;
  const MyNewsCatalog({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Image.network(
                news.image,
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
                      Text(news.title,
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(
                        news.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
