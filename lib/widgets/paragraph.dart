import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;
  const Paragraph({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto', // Font yang modern dan mudah dibaca
        fontSize: 14.0, // Ukuran teks moderat
        color: Colors.grey[800], // Warna gelap abu-abu seperti komentar
        height: 1.5, // Memberikan jarak baris yang nyaman
      ),
    );
  }
}
