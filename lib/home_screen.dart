import 'package:blogger/pages/home.dart';
import 'package:blogger/pages/messages.dart';
import 'package:blogger/pages/post.dart';
import 'package:blogger/pages/profile.dart';
import 'package:blogger/pages/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate around the bottom nav bar
  int _selectedIndex = 0;
  final currentUser = FirebaseAuth.instance.currentUser!;
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //different pages to navigate too
  final List<Widget> pages = [
    UserHome(),
    const UserSearch(),
    const UserPost(),
    const UserMessages(),
    const UserProfile(),
  ];

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 211, 222, 226),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 58, 119, 150),
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: "Profile")
        ],
      ),
    );
  }
}
