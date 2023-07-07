import 'package:blogger/display/bubble_stories.dart';
import 'package:blogger/display/user_posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  final List people = [
    'bokang.wav',
    'saba',
    'joeybadass',
    'smino',
    'mickjenkins',
    'tobilou'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              '/Users/bokang/Desktop/Side Projects/Blogger/blogger/assets/main-logo-white-transparent.png',
              height: 100,
              width: 100,
              scale: 0.8,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              width: 55,
            ),
            const Center(
              child: Text(
                "Blogger",
                style: TextStyle(
                  fontFamily: 'GT-America',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: signOut, icon: const Icon(Icons.logout_outlined))
        ],
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromARGB(255, 211, 222, 226),
      body: Column(children: [
        Container(
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length,
              itemBuilder: (context, index) {
                return BubbleStories(text: people[index]);
              }),
        ),

        //POSTS BY USERS
        Expanded(
            child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return UserPosts(
                    name: people[index],
                  );
                })),
      ]),
    );
  }
}
