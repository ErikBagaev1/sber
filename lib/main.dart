import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/pages/add_chek_page.dart';
import 'package:sber/pages/clean_page.dart';
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
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
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

      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        // elevation: 0,
        enableFeedback: true,

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
          ClearDataScreen(),
          ChekAdd(),
          Text('data'),
          HistoryPage()
        ],
      ),
    );
  }
}

final items = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_filled),
    label: 'Главная',
  ),
  BottomNavigationBarItem(
    icon: Container(
      width: 25, // Ширина фона
      height: 20, // Высота фона
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFF8a8a8a), // Цвет фона
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Icon(
          Icons.signal_cellular_alt,
          color: Color(0xFF1c1c1c), size: 16, // Цвет стрелки
        ),
      ),
    ),
    label: 'Накопления',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/Ассистент.svg',
      width: 25,
    ),
    label: 'Aссистент',
  ),
  BottomNavigationBarItem(
    icon: Container(
      width: 20, // Ширина фона
      height: 20, // Высота фона
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFF8a8a8a), // Цвет фона
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Icon(
          Icons.arrow_forward,
          color: Color(0xFF1c1c1c), size: 16, // Цвет стрелки
        ),
      ),
    ),
    label: 'Платежи',
  ),
  const BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.only(right: 8),
      child: Icon(Icons.watch_later),
    ),
    label: 'История  ',
  ),
];
