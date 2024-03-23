import 'package:flutter/material.dart';
import 'package:sber/pages/home_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TitleHistory extends StatelessWidget {
  const TitleHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 70,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'История',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              '...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 150,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Skeletonizer(
                      enabled: enabled,
                      child: SizedBox(
                        height: 130,
                        width: 220,
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFF1E1E1E),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Расходы в марте',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        const Spacer(),
                                        Skeleton.ignore(
                                          child: Icon(
                                            size: 16,
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      '17 923 ₽',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          '+ 20 600 ₽',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CardHistory(
                      icon: Icon(
                        Icons
                            .error_outline, // Иконка восклицательного знака без заливки
                        color: Colors.grey, // Цвет иконки
                        size: 34, // Размер иконки
                      ),
                      text: 'Укажите свой телефон',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CardHistory(
                      icon: Icon(
                        Icons
                            .monetization_on, // Иконка восклицательного знака без заливки
                        color: Colors.grey, // Цвет иконки
                        size: 34, // Размер иконки
                      ),
                      text: 'Деньги за покупки',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CardHistory(
                      icon: Icon(
                        Icons
                            .error_outline, // Иконка восклицательного знака без заливки
                        color: Colors.grey, // Цвет иконки
                        size: 34, // Размер иконки
                      ),
                      text: 'Выписки и справки',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class CardHistory extends StatelessWidget {
  final String text;
  final Icon icon;
  const CardHistory({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 130,
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFF1E1E1E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
