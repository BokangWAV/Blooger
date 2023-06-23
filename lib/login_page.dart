import 'package:blogger/components/button.dart';
import 'package:blogger/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  ///** Try sign in and show user error message if email or password is incorrect !
  /// */
  void signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );

      // pop loading dialog if logged in
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading dialog before we show our error message
      Navigator.pop(context);
      //display the message
      displayMessage(e.code);
    }
  }

  ///**Displaying the error message as a toast to the user */
  void displayMessage(String message) {
    String display;
    if (message == 'user-not-found') {
      display = "User Not Found";
    } else if (message == 'invalid-email') {
      display = "Invalid Email Address";
    } else {
      display = "Incorrect Password";
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                display,
                style: const TextStyle(
                    color: Color.fromARGB(255, 22, 39, 48),
                    fontFamily: 'GT-America',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color.fromARGB(255, 234, 240, 243),
              elevation: 24.0,
            ));
  }

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
                    "Login & Get Blogging!",
                    style: TextStyle(
                      fontSize: 20,
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
                    controller: passwordTextController,
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
                    onTap: signIn,
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
                        onTap: widget.onTap,
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
