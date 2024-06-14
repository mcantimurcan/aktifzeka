import 'dart:io';
import 'package:aktifzeka/screens/blogs/blog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:aktifzeka/screens/bookmark/bookmark.dart';
import 'package:aktifzeka/screens/documents/documents.dart';
import 'package:aktifzeka/screens/home/home.dart';
import 'package:aktifzeka/screens/login/auth_page.dart';
import 'package:aktifzeka/screens/onboarding/onboarding_screen.dart';
import 'package:aktifzeka/screens/youtube/youtube_page.dart';
import 'dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/constants.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: isviewed != 0 ? OnBoard() : const MyHomePage(title: 'Aktif Zeka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;
  final body = [
    YoutubePage(),
    const KoclukScreen(),
    const HomePage(),
    const BookmarkPage(),
    const BlogPage(),
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.blue, 
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              onPressed: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const AuthPage())),
            ),
          ),
        ],
      ),
      body: body[_currentIndex],
      extendBody: true,
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _currentIndex,
        onTabChange: _handleIndexChanged,
        barColor: Theme.of(context).colorScheme.background,
        tabs: [
          MoltenTab(
            icon: const Icon(
              Ionicons.logo_youtube,
            ),
            selectedColor: Colors.blue,
          ),
          MoltenTab(
            icon: const Icon(Ionicons.documents),
            selectedColor: Colors.blue,
          ),
          MoltenTab(
            icon: const Icon(Icons.home),
            selectedColor: Colors.blue,
          ),
          MoltenTab(
            icon: const Icon(Ionicons.bookmark),
            selectedColor: Colors.blue,
          ),
          MoltenTab(
            icon: const Icon(Icons.star),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
