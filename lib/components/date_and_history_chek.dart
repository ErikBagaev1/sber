import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String formatNumberWithSpaces(double numberString) {
  // Разделяем число на дробную и целую части
  List<String> parts = numberString.toString().split('.');
  String integerPart = parts[0]; // Целая часть числа

  // Форматируем целую часть числа
  String formattedIntegerPart =
      formatIntNumberWithSpaces(int.parse(integerPart));

  if (parts.length > 1) {
    // Если есть дробная часть числа
    String decimalPart = parts[1];
    String formattedDecimalPart =
        formatIntNumberWithSpaces(int.parse(decimalPart));

    // Убираем незначащие нули справа от дробной части
    int endIndex = formattedDecimalPart.length - 1;
    while (endIndex >= 0 && formattedDecimalPart[endIndex] == '0') {
      endIndex--;
    }
    formattedDecimalPart = formattedDecimalPart.substring(0, endIndex + 1);

    // Собираем результат, если дробная часть не пустая
    if (formattedDecimalPart.isNotEmpty) {
      return '$formattedIntegerPart,$formattedDecimalPart';
    } else {
      // Если дробная часть пустая, возвращаем только целую часть
      return formattedIntegerPart;
    }
  } else {
    // Если нет дробной части, возвращаем только целую часть
    return formattedIntegerPart;
  }
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
  final String totalCash;

  const DateChek({
    super.key,
    required this.date,
    required this.cash,
    required this.totalCash,
  });

  @override
  Widget build(BuildContext context) {
    final formattedCash = formatIntNumberWithSpaces(int.parse(
        (((double.parse(totalCash)).round()).toString()).replaceAll('.', '')));

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
  final String icon;
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
              // Если входящий перевод из сбербанка
              if (type == 'Входящий перевод' &&
                  icon == 'Сбербанк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/Перевод.svg',
                      width: 40,
                    )
                  ],
                ),
              // Если исходящий перевод из сбербанка
              if (type == 'Исходящий перевод' &&
                  icon == 'Сбербанк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/перевод_.svg',
                      width: 40,
                    )
                  ],
                ),

              // Если  перевод из OZON банка
              if (icon == 'OZON') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/озон.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Альфа банка
              if (icon == 'Альфа банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/альфа.jpg',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из вТБ банка
              if (icon == 'ВТБ') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/втб.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Тинькоф
              if (icon == 'Тинькоф') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/тиньк.jpg',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Райфайзен банк
              if (icon == 'Райфайзен банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/райф.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Газпром банк
              if (icon == 'Газпром банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/газпром.jpg',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Зенит банк
              if (icon == 'Зенит банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/зенит.jpg',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Открытие банк
              if (icon == 'Открытие банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/открытие.webp',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Почта банк
              if (icon == 'Почта банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/почта.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из рнкб
              if (icon == 'РНКБ банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/рнкб.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из росбанк
              if (icon == 'Росбанк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/росбанк.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из россельхоз
              if (icon == 'Россельхоз банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/россельхоз.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из россельхоз
              if (icon == 'Совком банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/совком.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из сургут
              if (icon == 'Сургут банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/сургут.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из убрил
              if (icon == 'УБРиР банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/убрир.jpg',
                        width: 40,
                      ),
                    )
                  ],
                ),
              // Если  перевод из Уралсиб
              if (icon == 'Уралсиб банк') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Установите радиус, чтобы получить круглую форму
                      child: Image.asset(
                        'assets/banks/уралсиб.png',
                        width: 40,
                      ),
                    )
                  ],
                ),

              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        fio,
                        softWrap: true,
                        overflow: TextOverflow
                            .ellipsis, // добавлено для случая переполнения
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SvgPicture.asset(
                      'assets/arrow.svg',
                      width: 18,
                    )
                  ],
                ),
              if (type != 'Исходящий перевод') // Проверяем статус чека
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '+$formattedCash ₽',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF08A652)),
                    ),
                    const Text(''),
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
