import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/pages/animation_page.dart';
import 'package:sber/theme/colors.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String pin = '';
  List<bool> filledDots = [false, false, false, false, false];

  void inputDigit(int digit) {
    if (filledDots.contains(false)) {
      int index = filledDots.indexOf(false);
      setState(() {
        filledDots[index] = true;
      });
    }

    // Дополняем введенный пин-код
    if (pin.length < 5) {
      setState(() {
        pin += digit.toString();
      });
      if (pin.length == 5) {
        checkPin(pin);
      }
    }
  }

  void checkPin(String pin) {
    if (pin == '12358') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    } else {
      setState(() {
        pin = '';
        filledDots = [
          false,
          false,
          false,
          false,
          false
        ]; // Очищаем заполненные точки
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
          // elevation: 0,
          enableFeedback: true,

          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: const Color(0xFF08A652),
          unselectedItemColor: const Color(0xFF888888),
          items: items1, type: BottomNavigationBarType.fixed,
          currentIndex: 0, //New
          onTap: null,
        ),
        backgroundColor: BODY_BLACK,
        appBar: AppBar(
          actions: [
            Container(
              width: 20, // Ширина рамки
              height: 20, // Высота рамки
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Форма - круг
                border: Border.all(
                  color: const Color(0xff04931f), // Цвет рамки
                  width: 2, // Толщина рамки
                ),
              ),
              child: const Center(
                child: Icon(
                  size: 15,
                  Icons.question_mark_outlined,
                  color: Color(0xff04931f), // Цвет значка
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.logout_outlined,
              color: Color(0xffc55d20),
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          backgroundColor: const Color(0xff1e1e1e),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset(
              'assets/LOGO.png',
              width: 36,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Введите пароль',
                    style: TextStyle(color: TEXT_GRAY),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: filledDots[i]
                                    ? const Color(0xff04931f)
                                    : const Color(0xff4b4b4b),
                                border:
                                    Border.all(color: const Color(0xff4b4b4b)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PinKey(text: '       ', digit: 1, onPressed: inputDigit),
                  PinKey(text: 'а б в г', digit: 2, onPressed: inputDigit),
                  PinKey(text: 'д е ж з', digit: 3, onPressed: inputDigit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PinKey(text: 'и й к л', digit: 4, onPressed: inputDigit),
                  PinKey(text: 'м н о п', digit: 5, onPressed: inputDigit),
                  PinKey(text: 'р с т у', digit: 6, onPressed: inputDigit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PinKey(text: 'ф х ц ч', digit: 7, onPressed: inputDigit),
                  PinKey(text: 'ш щ ъ ы', digit: 8, onPressed: inputDigit),
                  PinKey(text: 'ь э ю я', digit: 9, onPressed: inputDigit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Icon(
                      Icons.fingerprint,
                      color: GREEN_MEDIUM,
                      size: 35,
                    ),
                  )),
                  PinKey(text: '     ', digit: 0, onPressed: inputDigit),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        // Иконка "удалить последний символ"
                        child: const Icon(
                          Icons.keyboard_return_sharp,
                          color: GREEN_MEDIUM,
                          size: 35,
                        ),
                        onTap: () {
                          if (pin.isNotEmpty) {
                            setState(() {
                              pin = pin.substring(
                                  0,
                                  pin.length -
                                      1); // Удаляем последний символ из пин-кода
                              filledDots[pin.length] =
                                  false; // Убираем закрашивание последнего кружка
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Не могу войти',
                    style: TextStyle(color: Color(0xff04931f), fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Версия 15.7.0.',
                    style: TextStyle(color: TEXT_GRAY, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinDigitDisplay extends StatelessWidget {
  final int index;
  final String digit;

  const PinDigitDisplay({super.key, required this.index, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        digit,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class PinKey extends StatelessWidget {
  final String text;
  final int digit;
  final Function(int) onPressed;

  const PinKey(
      {super.key,
      required this.digit,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onPressed(digit),
        splashColor: Colors.transparent, // Убираем сплеш
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      digit.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xfff4f4f4),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 14, color: TEXT_GRAY),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final items1 = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.login_rounded),
    label: 'Вход',
  ),
  BottomNavigationBarItem(
    icon: Container(
      width: 25, // Ширина фона
      height: 20, // Высота фона
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFF8a8a8a), // Цвет фона
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Icon(
          Icons.signal_cellular_alt,
          color: Color(0xFF1c1c1c), size: 16, // Цвет стрелки
        ),
      ),
    ),
    label: 'Уведомления',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/Ассистент.svg',
      width: 25,
    ),
    label: 'На карте',
  ),
  BottomNavigationBarItem(
    icon: Container(
      width: 20, // Ширина фона
      height: 20, // Высота фона
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFF8a8a8a), // Цвет фона
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Color(0xFF1c1c1c), size: 16, // Цвет стрелки
      ),
    ),
    label: 'Оплата',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.watch_later),
    label: 'SberPay',
  ),
];
