import 'package:flutter/material.dart';
import 'package:ngoding_cuy/provider/user_data.dart';
import 'package:ngoding_cuy/widgets/time_picker.dart';
import 'package:provider/provider.dart';

import '../utils/notification_settings.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "profile";
  const ProfilePage(BuildContext context, {super.key});

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
          Text(
            Provider.of<Userdata>(context).name!,
            style: const TextStyle(
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
                color: Colors.white,
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
