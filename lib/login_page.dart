import 'package:blogger/components/button.dart';
import 'package:blogger/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 230, 237),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //logo
                  Center(
                    child: Image.asset(
                        '/Users/bokang/Desktop/Side Projects/Blogger/blogger/assets/main-logo-black-transparent.png'),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  //Welcome Back Message
                  const Text(
                    "Welcome To Blogger",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Sansita',
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //email textfield
                  MyTextField(
                    controller: emailTextController,
                    hintText: "Email Address",
                    obscureText: false,
                    icon: Icons.email,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    key: const ValueKey('Password'),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 2, 83, 126),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: obscureText,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //login button
                  MyButton(
                    onTap: () {},
                    text: 'Sign In',
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // go to registration page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not A Blogger Yet? ",
                        style: TextStyle(fontFamily: 'GT-America'),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Register Now.",
                          style: TextStyle(
                              fontFamily: 'GT-America',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
