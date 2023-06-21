import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void signOut() {
  FirebaseAuth.instance.signOut();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blogger",
          style: TextStyle(fontFamily: 'GT-America'),
        ),
        actions: const [
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
