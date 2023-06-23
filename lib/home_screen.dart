import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blogger",
          style: TextStyle(fontFamily: 'GT-America', fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body:
          Column(children: [Text("Logged in as: ${currentUser.displayName}")]),
    );
  }
}
