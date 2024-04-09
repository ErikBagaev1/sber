import 'package:flutter/material.dart';
import 'package:sber/animation/sceleton.dart';
import 'package:sber/components/date_and_history_chek.dart';
import 'package:sber/models/month.dart';
import 'package:sber/pages/home_page.dart';

class TitleHistory extends StatelessWidget {
  final String incoming;
  final String outgoing;
  const TitleHistory({
    super.key,
    required this.incoming,
    required this.outgoing,
  });

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final currentMonth = russianMonths[currentDate.month - 1];
    final incomingP = formatIntNumberWithSpaces(int.parse(
        (((double.parse(outgoing)).round()).toString()).replaceAll('.', '')));
    final outgoingP = formatIntNumberWithSpaces(int.parse(
        (((double.parse(incoming)).round()).toString()).replaceAll('.', '')));
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
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'SPB',
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
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 18,
                ),
                SizedBox(
                  height: 110,
                  width: 220,
                  child: AspectRatio(
                    aspectRatio: 1.8,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF1E1E1E),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          enabled1
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SkeletonContainer(
                                          text: 'Расходы в $currentMonth',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF313131),
                                          ),
                                          width: 110,
                                          height: 20,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          size: 16,
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SkeletonContainer(
                                      text: '$incomingP ₽',
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF313131)),
                                      width: 110,
                                      height: 27,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SkeletonContainer(
                                          text: 'Расходы в $currentMonth',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF313131),
                                          ),
                                          width: 110,
                                          height: 20,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Расходы в $currentMonth',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          size: 16,
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '$incomingP ₽',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '+$outgoingP ₽',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF08A652),
                                          ),
                                        ),
                                        const Text(
                                          ' зачислений',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ],
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
      width: 130,
      height: 110,
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
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
                      fontWeight: FontWeight.w500,
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
