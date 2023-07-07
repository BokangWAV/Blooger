import 'package:flutter/material.dart';

import '../display/explore_grid.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.blueGrey[200],
            child: Row(
              children: [
                const Icon(
                  Icons.search_sharp,
                  color: Color.fromARGB(255, 124, 129, 133),
                ),
                Container(
                  child: const Text(
                    '',
                    style: TextStyle(color: Color.fromARGB(255, 124, 129, 133)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 222, 226),
      body: const ExploreGrid(),
    );
  }
}
