import 'package:flutter/material.dart';

import '../main.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Создаем анимацию для появления текста
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Запускаем анимацию
    _controller.forward();

    // Ждем 3 секунды перед переходом на другой экран
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Сбербанк'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/Animation_page2.jpg',
                fit: BoxFit.fill,
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin:
                    const Offset(0, 0.4), // Начальное положение (центр экрана)
                end: const Offset(
                    0, 0.181), // Конечное положение (поднимаем наверх)
              ).animate(_controller),
              child: const Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Добрый день,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Максим!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
