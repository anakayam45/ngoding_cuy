import 'package:flutter/material.dart';
import 'package:ngoding_cuy/widgets/time_picker.dart';

import '../utils/notification_settings.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final MyNotification myNotification = MyNotification();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 50),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(children: const [
                      MyTimePicker(),
                    ])),
              ),
            ),
          )
        ],
      ),
    );
  }
}
