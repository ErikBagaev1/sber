import 'package:flutter/material.dart';
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
      home: Scaffold(
        backgroundColor: BODY_BLACK,
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.question_mark_outlined,
              color: GREEN_MEDIUM,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          backgroundColor: BODY_DARK_GRAY,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset(
              'assets/LOGO.png',
              width: 40,
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
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: filledDots[i] ? GREEN_LITE : TEXT_GRAY,
                                border: Border.all(color: Colors.grey),
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
                      color: Colors.green,
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
                          color: Colors.green,
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
                height: 200,
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
                        fontWeight: FontWeight.w900,
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
