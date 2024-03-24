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
                child: const Column(
                  children: [
                    TitleHistory(),
                  ],
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF2e2e2e),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Row(
                        children: [
                          const Text(
                            'Тип операций',
                            style: TextStyle(color: Color(0xFFdedede)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            size: 24,
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 68.0),
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : const Text('Loaded!'),
              ),
            ],
          ),
        ),
        const HistoryAppBar()
      ],
    ));
  }
}
