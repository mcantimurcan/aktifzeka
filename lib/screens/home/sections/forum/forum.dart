import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
        title: const Text(
          "YKS Forum",
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(),
    );
  }
}