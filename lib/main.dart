import 'package:blogger/auth/auth.dart';
import 'package:blogger/firebase_options.dart';
//import 'package:blogger/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
