import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          // Username
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 50),
          // Mode Gelap dan Switch
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Text(
                          'mode gelap',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
