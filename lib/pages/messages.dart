import 'package:flutter/material.dart';

class UserMessages extends StatelessWidget {
  const UserMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 222, 226),
      body: Center(child: Text('Messages')),
    );
  }
}
