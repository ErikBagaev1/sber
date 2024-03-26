import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sber/components/history_appbar.dart';
import 'package:sber/components/title_history.dart';
import 'package:sber/models/check.dart';
import 'package:sber/pages/home_page.dart';

import '../components/select_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final bool _isFirstLoad = true;
  List<Chek> _checks = [];
  Future<void> _refresh() async {
    // Устанавливаем enabled в true
    setState(() {
      enabled1 = true;
    });
    final random = Random();
    final delaySeconds = random.nextInt(2) + 1;
    await Future.delayed(Duration(seconds: delaySeconds));

    setState(() {
      enabled1 = false;
    });
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Вызов функции, которая изменяет состояние isLoading после случайного времени
    _simulateLoading();
    _loadChecks();
  }

  // Метод для загрузки чеков из локального хранилища
  void _loadChecks() async {
    try {
      List<Chek> loadedChecks = await CheckRepository.loadChecks();
      setState(() {
        _checks = loadedChecks;
      });
      print('Загруженные чеки:');
      print(_checks.length);
      for (var check in _checks) {
        print('Дата: ${check.date}, ФИО: ${check.fio}, Сумма: ${check.cash}');
      }
    } catch (e) {
      // Обработка ошибок, если загрузка не удалась
      print('Ошибка при загрузке чеков: $e');
    }
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
            // Ваш код здесь...
            backgroundColor: Colors.black,
            color: Colors.green,
            onRefresh: _refresh,
            displacement: 40,
            edgeOffset: 300.0,
            child: ListView.builder(
              itemCount: _checks.length,
              itemBuilder: (context, index) {
                // Создаем виджет DateChek для каждого элемента списка чеков
                return Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF3E4E5E),
                            Color(0xFF272E38),
                            Color.fromARGB(255, 35, 42, 51),
                            Color(0xFF1E1F21),
                            Color.fromARGB(255, 0, 0, 0),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: (index == 0)
                          ? const Column(
                              children: [
                                TitleHistory(),
                                SizedBox(
                                  height: 30,
                                ),
                                SelectBarList(),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    Center(
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(top: 68.0),
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              )
                            : DateChek(
                                date: _checks[index].date,
                                cash: _checks[index].cash,
                              )),
                  ],
                );
              },
            ),
          ),
          // Показываем Container только при первой загрузке

          const HistoryAppBar(),
        ],
      ),
    );
  }
}

class DateChek extends StatelessWidget {
  final String date;
  final String cash;
  const DateChek({
    super.key,
    required this.date,
    required this.cash,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            date,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const Spacer(),
          Text(
            '$cash ₽',
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF7d7d7d)),
          ),
        ],
      ),
    );
  }
}

class ChekHistory extends StatelessWidget {
  final String fio;
  final String type;
  final int cash;
  final Icon icon;
  const ChekHistory({
    super.key,
    required this.fio,
    required this.type,
    required this.cash,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: Colors.green,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fio,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF7d7d7d)),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '$cash ₽',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.restart_alt_outlined,
                    color: Colors.green,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SelectBarList extends StatelessWidget {
  const SelectBarList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Row(
              children: [
                SelectBar(text: 'Тип операций'),
                SizedBox(
                  width: 10,
                ),
                SelectBar(text: 'Период'),
                SizedBox(
                  width: 10,
                ),
                SelectBar(text: 'Карты и счета')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
