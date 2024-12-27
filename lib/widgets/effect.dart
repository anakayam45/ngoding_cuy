import 'package:flutter/material.dart';

BoxShadow myShaddow() {
  return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(2, 3));
}
