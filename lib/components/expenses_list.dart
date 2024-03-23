import 'package:flutter/material.dart';
import 'package:sber/pages/home_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'Expenses_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text(
                'Расходы в марте',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Spacer(),
              Text(
                'Все',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[700]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Skeletonizer(
                enabled: enabled,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Expenses(
                          cash: const Text(
                            '17 137 ₽',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          cardNumber: Text(
                            'Все расходы из 6000 ₽',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                          widget: ClipOval(
                            child: Container(
                                color: const Color(0xFFEDEFEF),
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
                            'Перводы людям',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                          cardNumber: const Text(
                            '10 831 ₽',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          widget: ClipOval(
                              child: Container(
                                  color: const Color(0xFFEDEFEF),
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
                                  color: const Color(0xFFEDEFEF),
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
          ),
        )
      ],
    );
  }
}
