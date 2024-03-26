import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          child: Skeletonizer(
            enabled: enabled1,
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
                      cardNumber: const Text(
                        '10 831 ₽',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      widget: SvgPicture.asset(
                        'assets/Перевод.svg',
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
                        '3 045 ₽',
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
          ),
        )
      ],
    );
  }
}
