import 'package:flutter/material.dart';

class WrongOrCorrect extends StatelessWidget {
  final bool? action;
  const WrongOrCorrect({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Icon(
        action == true ? Icons.check_circle : Icons.cancel,
        color: action == true ? Colors.green : Colors.red,
        size: 50,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              action == true ? "Benar!" : "Salah!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: action == true ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              action == true
                  ? "Selamat, jawabanmu benar!"
                  : "Coba lagi, jawabanmu salah.",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Tutup dialog
          },
          child: const Text(
            'Tutup',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
