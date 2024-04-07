import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/pages/add_chek_page.dart';
import 'package:sber/pages/clean_page.dart';
import 'package:sber/pages/history_page.dart';
import 'package:sber/pages/password.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            letterSpacing:
                -0.5, // Здесь задайте нужное вам значение для letterSpacing
          ),
          // Добавьте другие стили, если нужно
        ),
        fontFamily: 'SPB',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
      ),
      home: const PinCodeScreen(),
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
  late Future<CreditCard> creditCardFuture;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    creditCardFuture = initializeCreditCard();
    pageController = PageController(initialPage: 3);
  }

  int selectedIndex = 3;
  Future<CreditCard> initializeCreditCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return CreditCard.fromSharedPreferences(prefs);
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.jumpToPage(index);
      initializeCreditCard();
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
        selectedItemColor: const Color(0xFF08A652),
        unselectedItemColor: const Color(0xFF888888),
        items: items, type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex, //New
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<CreditCard>(
        future: creditCardFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Если данные загружаются, отображаем индикатор загрузки
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Если произошла ошибка при загрузке данных, отображаем сообщение об ошибке
            return Center(
              child: Text('Ошибка при загрузке данных: ${snapshot.error}'),
            );
          } else {
            // Если данные успешно загружены, отображаем страницу с данными
            CreditCard myCreditCard = snapshot.data!;
            return PageView(
              controller: pageController,
              children: [
                HomePage(myCreditCard: myCreditCard),
                const ClearDataScreen(),
                const ChekAdd(),
                const PinCodeScreen(),
                HistoryPage(myCreditCard: myCreditCard),
              ],
            );
          }
        },
      ),
    );
  }
}

final items = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_filled),
    label: 'Главный',
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
