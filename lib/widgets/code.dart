import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;
  const Paragraph({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Latar belakang gelap seperti editor kode
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Courier New', // Font monospaced
          fontSize: 14.0, // Ukuran font
          color: Colors.greenAccent, // Warna teks seperti sintaks koding
        ),
      ),
    );
  }
}
