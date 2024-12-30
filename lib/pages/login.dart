import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  static const routeName = "/login";
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Text("Register"),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Text tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Text tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text("Enter"),
            )
          ],
        ),
      ),
    );
  }
}
