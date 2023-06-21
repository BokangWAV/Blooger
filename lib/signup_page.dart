import 'package:blogger/components/button.dart';
import 'package:blogger/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = true;
  bool obscureConfirm = true;
  //text editing controllers
  final emailTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final fullnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  ///**Allow users to sign up for the app */
  void signUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ));
    //make sure passwords match

    if (passwordTextController.text != confirmPasswordTextController.text) {
      //pop loading circle
      Navigator.pop(context);
      displayMessage("Password's Do Not Match");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim());

      //pop after sign up
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    String display;
    if (message == "Password's Do Not Match") {
      display = "Passwords Do Not Math";
    } else if (message == 'weak-password') {
      display = "Weak Password, 6 Characters Or More Required";
    } else if (message == 'missing-email') {
      display = "Email Address Required";
    } else if (message == 'email-already-in-use') {
      display = "User Already Exists";
    } else {
      display = "Invalid Email Address";
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
                      '/Users/bokang/Desktop/Side Projects/Blogger/blogger/assets/main-logo-black-transparent.png',
                    ),
                  ),
                  //Welcome Back Message
                  const Text(
                    "Welcome To Blogger, Ready To Get Blogging?",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Sansita',
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //Username
                  MyTextField(
                    controller: usernameTextController,
                    hintText: "Username",
                    obscureText: false,
                    icon: Icons.person,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  MyTextField(
                    controller: fullnameTextController,
                    hintText: "Full Name",
                    obscureText: false,
                    icon: Icons.person_2_outlined,
                  ),

                  const SizedBox(
                    height: 5,
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
                  //Password
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
                    height: 5,
                  ),
                  //Confirm Password
                  TextFormField(
                    controller: confirmPasswordTextController,
                    key: const ValueKey('ConfirmmPassword'),
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
                              obscureConfirm = !obscureConfirm;
                            });
                          },
                          child: Icon(obscureConfirm
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: obscureConfirm,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Sign Up button
                  MyButton(
                    onTap: signUp,
                    text: 'Sign Up',
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // go to login page page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have An Account Already? ",
                        style: TextStyle(fontFamily: 'GT-America'),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login In.",
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
