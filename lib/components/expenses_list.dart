import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/components/date_and_history_chek.dart';
import 'package:sber/models/check.dart';

import 'Expenses_card.dart';

String? incoming;
String? outgoing;
List<Chek> _checks = [];

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
  });

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  void initState() {
    super.initState();

    _loadChecks();
  }

  // Метод для загрузки чеков из локального хранилища
  void _loadChecks() async {
    try {
      List<Chek> loadedChecks = await CheckRepository.loadChecks();

      setState(() {
        _checks = loadedChecks;
      });

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                'Расходы в марте',
                style: TextStyle(
                    letterSpacing: -0.5,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Spacer(),
              Text(
                'Все',
                style: TextStyle(
                    letterSpacing: -0.5,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF08A652)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Expenses(
                    cash: Text(
                      '${formatIntNumberWithSpaces(int.parse((((double.parse((outgoing ?? '0'))).round()).toString()).replaceAll('.', '')))} ₽',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    cardNumber: Text(
                      'Все расходы \nиз 0 ₽',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    widget: SvgPicture.asset(
                      'assets/Расходы.svg',
                      width: 40,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  //====================================
                  Expenses(
                    cash: Text(
                      'Перводы людям',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    cardNumber: Text(
                      '${formatIntNumberWithSpaces(int.parse((((double.parse((outgoing ?? '0')) - 120).round()).toString()).replaceAll('.', '')))} ₽',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    widget: SvgPicture.asset(
                      'assets/Переводы.svg',
                      width: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //====================================
                  Expenses(
                    cash: Text(
                      'Рестораны и кафе',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    cardNumber: const Text(
                      '0 ₽',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    widget: SvgPicture.asset(
                      'assets/Food.svg',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
