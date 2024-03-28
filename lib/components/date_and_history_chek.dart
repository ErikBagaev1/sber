import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String formatNumberWithSpaces(double number) {
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
  result = result.replaceAll(' .', ',');
  return result;
}

String formatIntNumberWithSpaces(int number) {
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
  result = result.replaceAll(' .', ',');
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
    final formattedCash = formatIntNumberWithSpaces(int.parse(
        (((double.parse(cash)).round()).toString()).replaceAll('.', '')));
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: date.substring(0, 2), // Получаем первые два символа
                  style: const TextStyle(
                    fontSize:
                        25, // Новый размер шрифта для первых двух символов
                    fontWeight: FontWeight.w500, // Жирный шрифт
                    color: Colors.white, // Цвет текста
                  ),
                ),
                TextSpan(
                  text: date.substring(2), // Получаем оставшуюся часть строки
                  style: const TextStyle(
                    fontSize: 20, // Размер шрифта для остальной части
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '$formattedCash ₽',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
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
  final double cash;
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
              if (type == 'Входящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/Перевод.svg',
                      width: 40,
                    )
                    // const Icon(
                    //   Icons.restart_alt_outlined,
                    //   color: Colors.green,
                    // )
                  ],
                ),
              if (type != 'Входящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/перевод_.svg',
                      width: 40,
                    )
                    // const Icon(
                    //   Icons.restart_alt_outlined,
                    //   color: Colors.green,
                    // )
                  ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Text('')
                    // const Icon(
                    //   Icons.restart_alt_outlined,
                    //   color: Colors.green,
                    // )
                  ],
                ),
              if (type != 'Исходящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '+$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                    const Text('')
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
