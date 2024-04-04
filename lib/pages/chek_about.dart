import 'package:flutter/material.dart';
import 'package:sber/components/date_and_history_chek.dart';
import 'package:sber/models/check.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/theme/colors.dart';

import '../animation/circular_animation.dart'; // Импортируем модель чека

class CheckDetailsScreen extends StatefulWidget {
  final Chek check; // Принимаем выбранный чек
  final CreditCard myCreditCart;
  const CheckDetailsScreen(
      {Key? key, required this.check, required this.myCreditCart})
      : super(key: key);

  @override
  _CheckDetailsScreenState createState() => _CheckDetailsScreenState();
}

class _CheckDetailsScreenState extends State<CheckDetailsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Имитация загрузки на 2 секунды
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // После 2 секунд скрываем индикатор загрузки
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedCash = formatIntNumberWithSpaces(int.parse(
        (((widget.check.cash).round()).toString()).replaceAll('.', '')));
    return Scaffold(
      backgroundColor: BODY_BLACK,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfff4f4f4)),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close), // Иконка крестика
          onPressed: () {
            Navigator.pop(context); // Закрытие экрана по нажатию на крестик
          },
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: GREEN_MEDIUM,
              ), // Отображаем индикатор загрузки
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF101113), // Night
                              Color.fromARGB(255, 28, 29, 32), // Eerie Black
                              Color.fromARGB(255, 38, 43, 44), // Eerie Black 2
                              Color.fromARGB(255, 42, 46, 52), // Raisin Black
                              Color.fromARGB(255, 61, 72, 76), // Gunmetal
                            ],
                          ),
                        ),
                        height: 350,
                        width: double.infinity,
                        child: Column(
                          children: [
                            (widget.check.status == 'Исходящий перевод')
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 80,
                                      ),
                                      const SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircleAnimation()),
                                      const Text(
                                        'Перевод отправлен',
                                        style: TextStyle(
                                            letterSpacing: -0.5,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '$formattedCash ₽',
                                        style: const TextStyle(
                                            letterSpacing: -0.5,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'В ${widget.check.icon} через СПБ',
                                        style: const TextStyle(
                                            letterSpacing: -0.5,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        widget.check.fio,
                                        style: const TextStyle(
                                            letterSpacing: -0.5,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                : const SafeArea(
                                    child: Text(
                                      'Перевод принят',
                                      style: TextStyle(
                                          letterSpacing: -0.5,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Статус перевода',
                                  style: TextStyle(
                                      letterSpacing: -1,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Узнать о зачислениях денежных средств на счет \nвы можете у получателя перевода',
                                  style: TextStyle(
                                      letterSpacing: -1,
                                      color: TEXT_GRAY,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.list_alt_sharp,
                                  size: 35,
                                  color: GREEN_MEDIUM,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Сохранить или отправить чек',
                                  style: TextStyle(
                                      letterSpacing: -0.5,
                                      color: Color(0xffffffff),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 60.0, right: 15, top: 5, bottom: 10),
                            child: Divider(
                              thickness: 0.1,
                              color: Color(0xFF7d7d7d),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 35,
                                  color: GREEN_MEDIUM,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Подробности операции',
                                  style: TextStyle(
                                      letterSpacing: -0.5,
                                      color: Color(0xffffffff),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Icon(
                                        weight: 30,
                                        size: 26,
                                        Icons.keyboard_arrow_down_sharp,
                                        color: TEXT_GRAY,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: GREEN_MEDIUM,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Center(
                                  child: Text(
                                'Вернуться назад',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Color(0xffffffff),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              )),
                            )),
                      ))
                ],
              ),
            ),
    );
  }
}
