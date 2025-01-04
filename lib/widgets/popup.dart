import 'package:flutter/material.dart';
// import 'package:ngoding_cuy/data/model/materi.dart';
// import 'package:provider/provider.dart';

class MyPopUp extends StatelessWidget {
  const MyPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height:
            MediaQuery.of(context).size.height * 0.4, // 40% dari tinggi layar
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                child: Image.asset("lib/images/img01.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width),
              ),
            ),
            const Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ini Judul",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8), // Spasi antara judul dan deskripsi
                    Text(
                      "Deskripsi",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // final course = Provider.of<NgodingCuy>(context).;
              },
              child: const Text("Pilih"),
            ),
          ],
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
