import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/api/service_api.dart';
import 'package:ngoding_cuy/pages/starting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/user_data.dart';
import '../widgets/my_widget.dart';

class MyLoginPage extends StatefulWidget {
  static const routeName = "/login";
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool status = true;

  // login
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _passwordLogin = TextEditingController();

  // register
  final TextEditingController _userNameRegister = TextEditingController();
  final TextEditingController _emailRegister = TextEditingController();
  final TextEditingController _passwordRegister = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: status
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          children: [
            // Top panel
            AnimatedContainer(
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                  color: const Color(0xFF1DCFF8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(status ? 50 : 0),
                      bottomRight: Radius.circular(status ? 50 : 0))),
              height: height(context) * (status ? .8 : .2),
              duration: const Duration(milliseconds: 400),
              child: Stack(
                children: [
                  // Login Form
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: status ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(100),
                              child: CircleAvatar(
                                radius: 90,
                                child: Image.network(
                                  "src",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Email or username
                            textField(
                              !status,
                              "Email",
                              controller: _emailLogin,
                            ),
                            const SizedBox(height: 16),
                            // Password
                            textField(
                              !status,
                              "Password",
                              pass: true,
                              controller: _passwordLogin,
                            ),
                            const SizedBox(height: 24),
                            myTextButton(
                                context: context,
                                onPressed: () async {
                                  try {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    Map<String, dynamic> result =
                                        await ApiService().login(
                                            _emailLogin.text,
                                            _passwordLogin.text);
                                    print(result);
                                    if (context.mounted) {
                                      prefs.setString("username",
                                          result["data"]["userName"]);
                                      Provider.of<Userdata>(context,
                                              listen: false)
                                          .setName(result["data"]["userName"]);
                                      Navigator.pushReplacementNamed(
                                          context, LandingPage.routeName);
                                    }
                                  } catch (e) {
                                    print("Gagal login $e");
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Login Text
                  loginNavigate(
                    context: context,
                    opacity: status ? 0 : 1,
                    children: [
                      const Text("Sudah punya akun?"),
                      TextButton(
                          onPressed: () {
                            print(status);
                            setState(
                              () {
                                status = !status;
                              },
                            );
                          },
                          child: const Text("Sign-in"))
                    ],
                  ),
                ],
              ),
            ),
            // Bottom panel
            AnimatedContainer(
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 211, 209),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(status ? 0 : 50),
                  topRight: Radius.circular(status ? 0 : 50),
                ),
              ),
              height: height(context) * (status ? .2 : .8),
              duration: const Duration(milliseconds: 350),
              child: Stack(
                children: [
                  // Register Form
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: status ? 0 : 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Username
                            textField(
                              status,
                              "Username",
                              controller: _userNameRegister,
                            ),
                            const SizedBox(height: 16),
                            // Email
                            textField(
                              status,
                              "Email",
                              controller: _emailRegister,
                            ),
                            const SizedBox(height: 16),
                            // Password
                            textField(
                              status,
                              "Password",
                              pass: true,
                              controller: _passwordRegister,
                            ),
                            const SizedBox(height: 24),
                            myTextButton(
                              context: context,
                              onPressed: () async {
                                print("Kirim 1");
                                try {
                                  ApiService().register(
                                      _userNameRegister.text,
                                      _emailRegister.text,
                                      _passwordRegister.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Berhasil Login")),
                                  );
                                } catch (e) {
                                  print("gagal Register, $e");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Gagal login: $e")),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Register Text
                  loginNavigate(
                      context: context,
                      opacity: status ? 1 : 0,
                      children: [
                        const Text("Belum punya akun?"),
                        TextButton(
                            onPressed: () {
                              print(status);
                              setState(
                                () {
                                  status = !status;
                                },
                              );
                            },
                            child: const Text("Sign-in"))
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailLogin.dispose();
    _passwordLogin.dispose();
    _userNameRegister.dispose();
    _emailRegister.dispose();
    _passwordRegister.dispose();
    super.dispose();
  }
}

Widget myTextButton(
    {required VoidCallback? onPressed,
    String data = "Enter",
    required BuildContext context}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: Theme.of(context).elevatedButtonTheme.style,
    child: Text(data),
  );
}

Widget loginNavigate(
    {required BuildContext context,
    required double opacity,
    required List<Widget> children}) {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 400),
    opacity: opacity,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    ),
  );
}
