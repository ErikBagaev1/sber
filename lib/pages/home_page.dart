import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/components/Expenses_card.dart';
import 'package:sber/components/card_balance.dart';
import 'package:sber/components/card_list.dart';
import 'package:sber/components/custom_app_bar.dart';
import 'package:sber/components/expenses_list.dart';
import 'package:sber/models/profile.dart';

import '../components/translation_cash.dart';
import '../models/check.dart';

bool enabled1 = false;
String? incoming;
String? outgoing;
List<Chek> _checks = [];

class HomePage extends StatefulWidget {
  CreditCard? myCreditCard;
  HomePage({
    super.key,
    required this.myCreditCard,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadChecks() async {
    try {
      List<Chek> loadedChecks = await CheckRepository.loadChecks();

      setState(() {
        _checks = loadedChecks;
      });

      outgoing = calculateTotalCashForStatus('Исходящий перевод');
      incoming = calculateTotalCashForStatus('Входящий перевод');
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
    // Устанавливаем состояние загрузки в true при запуске виджета
    _startLoading();
    _loadChecks();
  }

  // Функция для начала загрузки
  void _startLoading() {
    // Устанавливаем состояние isLoading в true
    setState(() {
      isLoading = true;
    });

    // Задержка на 2 секунды
    Future.delayed(const Duration(seconds: 1), () {
      // После задержки устанавливаем состояние isLoading в false
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF08A652),
              ),
            ),
          // Иначе отображаем содержимое страницы
          if (!isLoading)
            RefreshIndicator(
              displacement: 80,
              backgroundColor: Colors.black,
              color: const Color(0xFF08A652),
              onRefresh: _refresh,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 70),
                          child: CardBalanceWidget(
                            myCreditCard: widget.myCreditCard ??
                                CreditCard(
                                  // Присваиваем всем полям пустые строки
                                  cardNumber: '0000 0000 0000 0000',
                                  provider: '00000', name: 'no name',
                                  cvc: '000',
                                  expirationDate: '00000',
                                  phoneNumber: '0000000000',
                                  email: '0@0.0',
                                ),
                            balance: (double.parse(incoming ?? '0') -
                                    double.parse(outgoing ?? '0'))
                                .toString(),
                          ),
                        ),
                        CardsList(
                          balance: (double.parse(incoming ?? '0') -
                                  double.parse(outgoing ?? '0'))
                              .toString(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        const TranslationCash(),
                        const ExpensesList(),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Кредиты',
                                    style: TextStyle(
                                        letterSpacing: -0.5,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    size: 24,
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.add,
                                      color: Color(0xFF08A652)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Сервисы',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Expenses(
                                          cash: const Text(
                                            'Оформить ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                          cardNumber: Text(
                                            '''Карту, вклад \nкредит и другое''',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          widget: SvgPicture.asset(
                                            'assets/Plus.svg',
                                            width: 30,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //====================================
                                      Expenses(
                                          cash: Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          cardNumber: const Text(
                                            'Все \nсервисы',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                          widget: SvgPicture.asset(
                                            'assets/Виджет.svg',
                                            width: 30,
                                          )),
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
                                          '3 045 ₽',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        widget: SvgPicture.asset(
                                          'assets/Star.svg',
                                          width: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF435063),
                      Color.fromARGB(255, 60, 69, 81),
                      Color.fromARGB(255, 57, 66, 77),
                      Color.fromARGB(255, 57, 66, 73),
                      Color(0xFF333A45),
                      Color(0xFF2F343C),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomAppBar(
                  myCreditCard: widget.myCreditCard ??
                      CreditCard(
                        // Присваиваем всем полям пустые строки
                        cardNumber: '0000 0000 0000 0000',
                        provider: '00000', name: 'no name', cvc: '000',
                        expirationDate: '00000',
                        phoneNumber: '0000000000',
                        email: '0@0.0',
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
