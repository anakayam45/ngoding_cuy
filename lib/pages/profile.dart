import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Your Profile"),
    );
  }
}