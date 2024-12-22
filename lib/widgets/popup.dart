import 'package:flutter/material.dart';

class MyPopUp extends StatelessWidget {
  const MyPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
          height: 300, // Atur tinggi dari konten dialog
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          )),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal")),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Pilih")),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
