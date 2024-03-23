import 'package:flutter/material.dart';
import 'package:sber/components/Expenses_card.dart';
import 'package:sber/components/card_balance.dart';
import 'package:sber/components/card_list.dart';
import 'package:sber/components/custom_app_bar.dart';
import 'package:sber/components/expenses_list.dart';
import 'package:sber/components/translation_cash.dart';

bool enabled = false;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refresh() async {
    // Устанавливаем enabled в true
    setState(() {
      enabled = true;
    });

    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Expanded(
            child: RefreshIndicator(
              displacement: 80,
              backgroundColor: Colors.black,
              color: Colors.green,
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 70),
                          child: CardBalanceWidget(),
                        ),
                        CardsList(),
                        SizedBox(height: 24),
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
                                  Icon(Icons.add, color: Colors.green[700]),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        children: [
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
                                            widget: ClipOval(
                                              child: Container(
                                                  color:
                                                      const Color(0xFFEDEFEF),
                                                  child: const Icon(
                                                    Icons.person,
                                                    size: 40,
                                                  )),
                                            ),
                                          ),
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
                                            widget: ClipOval(
                                                child: Container(
                                                    color:
                                                        const Color(0xFFEDEFEF),
                                                    child: const Icon(
                                                      Icons.person,
                                                      size: 40,
                                                    ))),
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
                                              '3 045 ₽',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            widget: ClipOval(
                                                child: Container(
                                                    color:
                                                        const Color(0xFFEDEFEF),
                                                    child: const Icon(
                                                      Icons.person,
                                                      size: 40,
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                child: const CustomAppBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
