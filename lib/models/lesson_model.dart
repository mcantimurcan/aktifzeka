import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String youtuber;
  final String imageUrl;
  final double rating;

  Lesson(
      {required this.title,
      required this.youtuber,
      required this.imageUrl,
      required this.rating});
}

class LessonPage extends StatelessWidget {
  final Lesson lesson;

  LessonPage({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(lesson.imageUrl), // youtube cover image
          Text(lesson.youtuber), // youtuber name
          Row(
            children: List.generate(lesson.rating.round(),
                (index) => Icon(Icons.star, color: Colors.yellow)),
          ),
          ElevatedButton(
            onPressed: () {
              // insert youtube link here
            },
            child: Text('Go to Youtube'),
          ),
        ],
      ),
    );
  }
}
