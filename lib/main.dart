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
import 'package:aktifzeka/screens/star/star_page.dart';
import 'package:aktifzeka/screens/youtube/youtube_page.dart';
import 'dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/constants.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: isviewed != 0 ? OnBoard() : const MyHomePage(title: 'YKS Cepte'),
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
  int _currentIndex = 0;
  final body = [
    const HomePage(),
    YoutubePage(),
    const DocumentsPage(),
    const BookmarkPage(),
    const StarPage(),
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
          style: const TextStyle(color: Colors.purple),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.purple,
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
            icon: const Icon(Icons.home),
            selectedColor: Colors.purple,
          ),
          MoltenTab(
            icon: const Icon(
              Ionicons.logo_youtube,
            ),
            selectedColor: Colors.purple,
          ),
          MoltenTab(
            icon: const Icon(Ionicons.documents),
            selectedColor: Colors.purple,
          ),
          MoltenTab(
            icon: const Icon(Ionicons.bookmark),
            selectedColor: Colors.purple,
          ),
          MoltenTab(
            icon: const Icon(Icons.star),
            selectedColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
