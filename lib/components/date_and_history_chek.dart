import 'package:flutter/material.dart';

String formatNumberWithSpaces(int number) {
  String formattedString = number.toString();
  String result = '';
  int count = 0;

  // Проходим по строке справа налево и добавляем пробел каждые 3 символа
  for (int i = formattedString.length - 1; i >= 0; i--) {
    result = formattedString[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ' $result';
    }
  }

  return result;
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
    final formattedCash = formatNumberWithSpaces(int.parse(cash));
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Row(
        children: [
          Text(
            date,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const Spacer(),
          Text(
            '$formattedCash ₽',
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
    final formattedCash = formatNumberWithSpaces(cash);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
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
              if (type != 'Входящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    // const Icon(
                    //   Icons.restart_alt_outlined,
                    //   color: Colors.green,
                    // )
                  ],
                ),
              if (type != 'Исходящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '+$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ],
                ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 5, top: 10),
            child: Divider(
              thickness: 0.2,
              color: Color(0xFF7d7d7d),
            ),
          )
        ],
      ),
    );
  }
}
