import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aktifzeka/screens/home/screens/pomodoro/pomodoro.dart';
import 'package:aktifzeka/screens/home/screens/puan_hesaplama/puan_hesaplama.dart';
import 'package:aktifzeka/screens/home/screens/yks_geri_sayim/yks_countdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const PomodoroScreen())),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Pomodoro",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const PuanPage())),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calculate,
                        color: Colors.white,
                        size: 50,
                      ),
                      Center(
                        child: Text(
                          "YKS Puan Hesaplama",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const YKSCountdownPage())),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "YKS Geri Sayım",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "EBA 3D Materyal",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB38ED3),
                  ),
                  width: width * 0.28,
                  height: height * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Deneme Kutusu 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
