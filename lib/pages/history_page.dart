import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sber/components/date_and_history_chek.dart';
import 'package:sber/components/history_appbar.dart';
import 'package:sber/components/title_history.dart';
import 'package:sber/models/check.dart';
import 'package:sber/pages/home_page.dart';

import '../components/select_bar.dart';

bool inserach = true;
bool? isSearching;
String? incoming;
String? outgoing;

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // final bool _isFirstLoad = true;
  String calculateTotalCashForStatus(String status) {
    double totalCash = 0;

    // Проходим по всем чекам
    for (var check in _checks) {
      // Если статус чека совпадает с заданным статусом, добавляем его сумму к общей сумме
      if (check.status == status) {
        totalCash += check.cash;
      }
    }

    // Возвращаем строковое представление общей суммы
    return '$totalCash';
  }

  List<Chek> _checks = [];
  List<Chek> _newChecks = [];
  Future<void> _refresh() async {
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
      incoming = calculateTotalCashForStatus('Входящий перевод');
      outgoing = calculateTotalCashForStatus('Исходящий перевод');
      // print('Загруженные чеки:');
      // print(_checks.length);
      // for (var check in _checks) {
      //   print('Дата: ${check.date}, ФИО: ${check.fio}, Сумма: ${check.cash}');
      // }
    } catch (e) {
      // Обработка ошибок, если загрузка не удалась
      // ignore: avoid_print
      print('Ошибка при загрузке чеков: $e');
    }
  }

  String calculateTotalCashForDate(String currentDate) {
    double totalCash = 0;

    // Проходим по всем чекам
    for (var check in _checks) {
      // Если дата чека совпадает с текущей датой, добавляем его сумму к общей сумме
      if (check.date == currentDate) {
        totalCash += check.cash;
      }
    }

    // Возвращаем строковое представление общей суммы
    return '$totalCash';
  }

  void filterChecksByAmount(int amount) {
    setState(() {
      // Фильтруем чеки на основе введенной суммы
      _newChecks = _checks.where((check) => check.cash == amount).toList();
      _checks = _newChecks;
    });
  }

  void resetChecks() {
    setState(() {
      // Сбрасываем фильтр и показываем все чеки
      _loadChecks();
    });
  }

  // Функция, которая имитирует загрузку данных
  Future<void> _simulateLoading() async {
    // Генерация случайного времени от 1 до 2 секунд

    final random = Random();
    final delaySeconds = random.nextInt(2) + 1;

    setState(() {
      enabled1 = true;
    });
    // Задержка на случайное время
    await Future.delayed(Duration(seconds: delaySeconds));

    // После задержки обновляем состояние, чтобы скрыть индикатор загрузки

    setState(() {
      isLoading = false;
      enabled1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Сортируем список чеков по дате
    _checks.sort((a, b) => b.date.compareTo(a.date));

    // Создаем список уникальных дат
    List<String> uniqueDates =
        _checks.map((check) => check.date).toSet().toList();

    return SafeArea(
      child: Stack(
        children: [
          RefreshIndicator(
            backgroundColor: Colors.black,
            color: Colors.green,
            onRefresh: _refresh,
            displacement: 40,
            edgeOffset: 300.0,
            child: ListView.builder(
              itemCount: uniqueDates.length,
              itemBuilder: (context, index) {
                // Получаем текущую дату
                String currentDate = uniqueDates[index];

                // Создаем виджет DateChek для текущей даты
                Widget dateChek = DateChek(
                  date: currentDate,
                  cash: calculateTotalCashForDate(currentDate),
                );

                // Фильтруем чеки по текущей дате
                List<Chek> filteredChecks = _checks
                    .where((check) => check.date == currentDate)
                    .toList();
                if (searchAmount != null) {
                  filteredChecks = filteredChecks
                      // ignore: unrelated_type_equality_checks
                      .where((check) => check.cash == searchAmount)
                      .toList();
                }
                // Создаем виджеты ChekHistory для отфильтрованных чеков
                List<Widget> chekHistoryWidgets = filteredChecks
                    .map((check) => ChekHistory(
                          fio: check.fio,
                          type: check.status,
                          cash: check.cash,
                          icon: const Icon(Icons.abc),
                        ))
                    .toList();

                // Возвращаем виджеты в списке
                return Column(
                  children: [
                    if (index == 0 && !inserach)
                      const SizedBox(
                        height: 70,
                      ),
                    if (index == 0 && (inserach))
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0e0e0e),
                              Color(0xFF0f0f0f),
                              Color(0xFF111110),
                              Color(0xFF131312),
                              Color(0xFF151514),
                              // Color(0xFF171716),
                              // Color(0xFF191918),
                              // Color(0xFF1b1b1a),
                              // Color(0xFF1d1d1b),
                              // Color(0xFF1f1f1d),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Показываем HistoryAppBar только если не идет поиск
                            TitleHistory(
                              incoming: incoming!,
                              outgoing: outgoing!,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SelectBarList(),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    Center(
                        child: isLoading
                            ? Center(
                                child: (index == 0)
                                    ? const Padding(
                                        padding: EdgeInsets.only(top: 68.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.green,
                                        ),
                                      )
                                    : const Text(''))
                            : Column(
                                children: [
                                  dateChek,
                                  ...chekHistoryWidgets,
                                ],
                              )),
                  ],
                );
              },
            ),
          ),
          // Показываем Container только при первой загрузке

          HistoryAppBar(
            onSearchAmountChanged: filterChecksByAmount,
            resetCheck: resetChecks,
          ),
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
