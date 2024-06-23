import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PuanPage extends StatefulWidget {
  const PuanPage({super.key});

  @override
  State<PuanPage> createState() => _PuanPageState();
}

class _PuanPageState extends State<PuanPage> {
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
          "YKS Puan Hesaplama",
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