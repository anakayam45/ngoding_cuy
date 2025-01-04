import 'package:flutter/material.dart';

import '../widgets/my_widget.dart';

class MyLoginPage extends StatefulWidget {
  static const routeName = "/login";
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool status = true;
  final GlobalKey _key = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: status
            ? const Color.fromARGB(255, 243, 211, 209)
            : const Color.fromARGB(255, 103, 185, 252),
        body: ListView(
          children: [
            Column(
              children: [
                // Top panel
                GestureDetector(
                  onTap: () {
                    setState(() {
                      status = true;
                    });
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 123, 181, 229),
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
                          child: Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Image.network(
                                        "https://i.postimg.cc/nz0YBQcH/Logo-light.png",
                                        height: 100,
                                      ),
                                      SizedBox(
                                        height: height(context) * 0.1,
                                      ),
                                      // Email or username
                                      textField(
                                        status,
                                        "Email",
                                        key: _key,
                                        controller: _controller,
                                      ),
                                      const SizedBox(height: 16),
                                      // Password
                                      textField(
                                        status,
                                        "Password",
                                        pass: true,
                                        key: _key,
                                        controller: _controller,
                                      ),
                                      const SizedBox(height: 24),
                                      myTextButton(
                                        onPressed: () =>
                                            print(_controller.text),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Login Text
                        myAnimatedOpacity(
                          context,
                          status ? 0 : 1,
                          "Sign-in",
                          () {
                            setState(
                              () {
                                status = true;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom panel
                AnimatedContainer(
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
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Username
                                  textField(
                                    status,
                                    "Username",
                                    key: _key,
                                    controller: _controller,
                                  ),
                                  const SizedBox(height: 16),
                                  // Email
                                  textField(
                                    status,
                                    "Email",
                                    key: _key,
                                    controller: _controller,
                                  ),
                                  const SizedBox(height: 16),
                                  // Password
                                  textField(
                                    status,
                                    "Password",
                                    pass: true,
                                    key: _key,
                                    controller: _controller,
                                  ),
                                  const SizedBox(height: 24),
                                  myTextButton(
                                    onPressed: () => print("object"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Register Text
                      myAnimatedOpacity(
                        context,
                        status ? 1 : 0,
                        "Sign up",
                        () {
                          setState(
                            () {
                              status = false;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
