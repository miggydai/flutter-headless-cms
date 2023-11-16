import 'package:flutter/material.dart';
import 'package:flutter_headless_cms/models/posts.dart';

class MyCard extends StatelessWidget {
  final Posts post;

  const MyCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.content,
                maxLines: 7,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
              ),
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.panorama_fish_eye),
                label: Text("Read Article"))
          ],
        ),
      ),
    );
  }
}
