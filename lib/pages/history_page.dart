import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sber/components/history_appbar.dart';
import 'package:sber/components/title_history.dart';
import 'package:sber/pages/home_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<void> _refresh() async {
    // Устанавливаем enabled в true
    setState(() {
      enabled = true;
    });
    final random = Random();
    final delaySeconds = random.nextInt(2) + 1;
    await Future.delayed(Duration(seconds: delaySeconds));

    setState(() {
      enabled = false;
    });
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Вызов функции, которая изменяет состояние isLoading после случайного времени
    _simulateLoading();
  }

  // Функция, которая имитирует загрузку данных
  Future<void> _simulateLoading() async {
    // Генерация случайного времени от 1 до 2 секунд
    final random = Random();
    final delaySeconds = random.nextInt(2) + 1;

    // Задержка на случайное время
    await Future.delayed(Duration(seconds: delaySeconds));

    // После задержки обновляем состояние, чтобы скрыть индикатор загрузки

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        RefreshIndicator(
          backgroundColor: Colors.black,
          color: Colors.green,
          onRefresh: _refresh,
          displacement: 40,
          edgeOffset: 300.0,
          child: ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF435063),
                      Color(0xFF37424F),
                      Color(0xFF303743),
                      Color(0xFF24272E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const TitleHistory(),
                    Center(
                      child: isLoading
                          ? const CircularProgressIndicator() // Отображаем индикатор загрузки, если isLoading равно true
                          : const Text(
                              'Loaded!'), // Отображаем контент, если isLoading равно false
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const HistoryAppBar()
      ],
    ));
  }
}
