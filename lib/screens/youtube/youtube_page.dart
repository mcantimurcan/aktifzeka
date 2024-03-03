import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aktifzeka/models/lesson_model.dart';

class YoutubePage extends StatelessWidget {
  YoutubePage({super.key});
  final lessons = [
    Lesson(
        title: "Math", youtuber: "Youtuber 1", imageUrl: "url1", rating: 9.0),
    Lesson(
        title: "Physics",
        youtuber: "Youtuber 2",
        imageUrl: "url2",
        rating: 8.5),
    // add more lessons
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(lessons[index].title),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LessonPage(lesson: lessons[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}