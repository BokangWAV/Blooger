import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String name;
  const UserPosts({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //profile photo
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'GT-America'),
                  ),
                ],
              ),
              const Icon(Icons.menu),
            ],
          ),
        ),
        Container(
          height: 400,
          color: Colors.grey,
        ),
        //**Below posts  -> buttons & comments */
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline_rounded),
                  ),
                  Icon(Icons.send),
                ],
              ),
              Icon(Icons.bookmark_add_outlined)
            ],
          ),
        ),
        // like by
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Text(
                'Liked by ',
                style: TextStyle(fontFamily: 'GT-America', fontSize: 15),
              ),
              Text(
                'einstein',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(' and '),
              Text(
                'others',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),

        //caption
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'GT-America',
                      fontSize: 16),
                  children: [
                TextSpan(
                    text: name, style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' kick rocks')
              ])),
        ),

        //comments
      ],
    );
  }
}
