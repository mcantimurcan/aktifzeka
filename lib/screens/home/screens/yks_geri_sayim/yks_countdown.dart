import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class YKSCountdownPage extends StatefulWidget {
  const YKSCountdownPage({
    super.key,
    required this.deadline,
  });

  final DateTime deadline;

  @override
  State<YKSCountdownPage> createState() => _YKSCountdownPageState();
}

class _YKSCountdownPageState extends State<YKSCountdownPage> {
  late Timer timer;
  Duration duration = const Duration();

  @override
  void initState() {
    calculateTimeLeft(widget.deadline);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => calculateTimeLeft(widget.deadline),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var textStyle = Theme.of(context).textTheme.headlineLarge!;
    var labelTextStyle = Theme.of(context).textTheme.bodyMedium!;

    final days = DefaultTextStyle(
      style: textStyle,
      child: Text(
        duration.inDays.toString().padLeft(2, '0'),
      ),
    );

    final hours = DefaultTextStyle(
      style: textStyle,
      child: Text(
        duration.inHours.remainder(24).toString().padLeft(2, '0'),
      ),
    );

    final minutes = DefaultTextStyle(
      style: textStyle,
      child: Text(
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
      ),
    );

    final seconds = DefaultTextStyle(
      style: textStyle,
      child: Text(
        duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
        title: const Text(
          "YKS'ye Ne Kadar Kaldı?",
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.network(
            "https://lottie.host/d8ccafc8-5598-4cc4-8951-14de55a63a48/Ggao6U2LLQ.json",
            height: height * 0.30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 12, 44, 104),
                        Color.fromARGB(255, 37, 152, 156),
                      ],
                    ).createShader(
                      Rect.fromLTWH(
                        0,
                        0,
                        bounds.width,
                        bounds.height,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: days,
                    ),
                  ),
                  DefaultTextStyle(
                    style: labelTextStyle,
                    child: const Text("Gün"),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 12, 44, 104),
                        Color.fromARGB(255, 37, 152, 156),
                      ],
                    ).createShader(
                      Rect.fromLTWH(
                        0,
                        0,
                        bounds.width,
                        bounds.height,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: hours,
                    ),
                  ),
                  DefaultTextStyle(
                    style: labelTextStyle,
                    child: const Text("Saat"),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 12, 44, 104),
                        Color.fromARGB(255, 37, 152, 156),
                      ],
                    ).createShader(
                      Rect.fromLTWH(
                        0,
                        0,
                        bounds.width,
                        bounds.height,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: minutes,
                    ),
                  ),
                  DefaultTextStyle(
                    style: labelTextStyle,
                    child: const Text("Dakika"),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 12, 44, 104),
                        Color.fromARGB(255, 37, 152, 156),
                      ],
                    ).createShader(
                      Rect.fromLTWH(
                        0,
                        0,
                        bounds.width,
                        bounds.height,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: seconds,
                    ),
                  ),
                  DefaultTextStyle(
                    style: labelTextStyle,
                    child: const Text("Saniye"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void calculateTimeLeft(DateTime deadline) {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    setState(() {
      duration = Duration(seconds: seconds);
    });
  }
}
