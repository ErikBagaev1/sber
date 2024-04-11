import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/models/check.dart';
import 'package:sber/models/profile.dart';

import '../components/date_and_history_chek.dart';

class IncomingPage extends StatelessWidget {
  final Chek chek;
  final CreditCard myCreditCard;

  const IncomingPage({Key? key, required this.chek, required this.myCreditCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xff2c8441)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Перевод выполнен',
            style: TextStyle(
                color: Color(0xfffefefe), fontWeight: FontWeight.w500),
          )),
      backgroundColor: const Color(0xff121212),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
              const Duration(seconds: 2)), // Задержка в 2 секунды
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Показываем индикатор загрузки
              return const CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.green), // Зеленый цвет
              );
            } else {
              // Показываем вашу верстку после завершения задержки
              return YourContentWidget(
                myCreditCard: myCreditCard,
                chek: chek,
              ); // Замените YourContentWidget на вашу верстку
            }
          },
        ),
      ),
    );
  }
}

// Замените этот виджет на вашу верстку, которая должна отобразиться после загрузки
class YourContentWidget extends StatelessWidget {
  final Chek chek;
  final CreditCard myCreditCard;
  const YourContentWidget(
      {super.key, required this.chek, required this.myCreditCard});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                // Внешний круг
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff12912a).withOpacity(0.09),
                  ),
                ),
                // Средний круг
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff12912a).withOpacity(0.1),
                  ),
                ),
                // Внутренний круг
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 19, 125, 38),
                  ),
                  child: Transform.rotate(
                    angle: 180 * 3.1415926535 / 180,
                    child: const Icon(
                      Icons.forward,
                      color: Color(0xff0d160f),
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text('${formatNumberWithSpaces(chek.cash)} ₽',
                style: const TextStyle(
                    color: Color(0xfffbfbfb),
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 10,
            ),
            Text(chek.fio,
                style: const TextStyle(
                    color: Color(0xffeeeeee),
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff1e1e1e)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/Icons/Чек.svg',
                          width: 28,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text('Сохранить \nсправку',
                            style: TextStyle(
                                color: Color(0xffeeeeee),
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        )
      ],
    );
  }
}
