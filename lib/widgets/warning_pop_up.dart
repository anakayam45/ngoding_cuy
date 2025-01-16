import 'package:flutter/material.dart';

class WarningPopUp extends StatefulWidget {
  final String? title;
  final String? desc;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  const WarningPopUp({
    super.key,
    this.title,
    this.color,
    this.onPressed,
    this.desc,
    this.icon,
    this.iconColor,
  });

  @override
  State<WarningPopUp> createState() => _WarningPopUpState();
}

class _WarningPopUpState extends State<WarningPopUp> {
  @override
  Widget build(context) {
    return Material(
      color: const Color.fromARGB(92, 158, 158, 158),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
                color: widget.color ?? Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Icon(
                          widget.icon ?? Icons.info_outline,
                          color: widget.iconColor ?? Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          widget.title ??
                              "Warning!jhbdvjhsbdvjhbshjvbhjvbdfjbh",
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
