import 'package:flutter/material.dart';
import 'package:sber/pages/add_chek_page.dart';
import 'package:sber/pages/history_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Сбербанк',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Сбербанк'),
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
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  int selectedIndex = 0;
  void _onItemTapped(int index) {
    // new
    setState(() {
      selectedIndex = index;

      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        // elevation: 0,
        // enableFeedback: false,

        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFF18892C),
        unselectedItemColor: const Color(0xFF888888),
        items: items, type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex, //New
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.black,
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          Text('data'),
          ChekAdd(),
          Text('data'),
          HistoryPage()
        ],
      ),
    );
  }
}

const items = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_filled),
    label: 'Главная',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.camera),
    label: 'Накопления',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat),
    label: 'Aссистент',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat),
    label: 'Платежи',
  ),
  BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.only(right: 8),
      child: Icon(Icons.watch_later),
    ),
    label: 'История  ',
  ),
];
