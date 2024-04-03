import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/models/profile.dart';

class AboutCards extends StatefulWidget {
  final String balance;
  final CreditCard myCreditCard;
  const AboutCards(
      {super.key, required this.myCreditCard, required this.balance});

  @override
  State<AboutCards> createState() => _AboutCardsState();
}

class _AboutCardsState extends State<AboutCards>
    with SingleTickerProviderStateMixin {
  bool isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  void _flipCard() {
    if (_controller.status != AnimationStatus.forward) {
      if (_isFront) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isFront = !_isFront;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfff4f4f4)),
        backgroundColor: const Color(0xFF121212),
        title: Text(
          widget.myCreditCard.provider,
          style: const TextStyle(
              color: Color(0xfff4f4f4), fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8),
                child: GestureDetector(
                  onTap: _flipCard,
                  child: Transform(
                    transform: Matrix4.rotationY((_animation.value) * pi),
                    alignment: Alignment.center,
                    child: _isFront
                        ? AboutCardsData(
                            balance: widget.myCreditCard.name,
                            bacgcolor: const Color(0xff1e1e1e),
                            numberCards: widget.myCreditCard.cardNumber,
                            dateCards: widget.myCreditCard.expirationDate,
                          )
                        : Transform(
                            transform: Matrix4.rotationY(pi),
                            alignment: Alignment.center,
                            child: Container(
                              width: 360,
                              height: 230,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 169, 191, 208),
                                      Color.fromARGB(255, 112, 134, 150),
                                      Color.fromARGB(255, 83, 100, 112),
                                      Color.fromARGB(255, 83, 100, 112),
                                      Color.fromARGB(255, 112, 134, 150),
                                      Color.fromARGB(255, 169, 191, 208),
                                      // Color(0xFF171716),
                                      // Color(0xFF191918),
                                      // Color(0xFF1b1b1a),
                                      // Color(0xFF1d1d1b),
                                      // Color(0xFF1f1f1d),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Сбер.svg',
                                          width: 50,
                                        ),
                                        const Text('sberpay')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text('${widget.balance} ₽',
                  style: const TextStyle(
                      color: Color(0xfff4f4f4),
                      fontSize: 21,
                      fontWeight: FontWeight.w500)),
              const Text(
                'Карта в рублях',
                style: TextStyle(color: Color(0xff898989), fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: const Color(0xff1e1e1e),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.access_time_filled_sharp,
                                size: 30,
                                color: Color(0xff32793d),
                              ),
                              Spacer(),
                              Text(
                                'Оплатить \nили перевести',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xfff4f4f4)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text('ЖКХ, QR и другие',
                                  style: TextStyle(
                                      color: Color(0xff898989), fontSize: 12))
                            ]),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: const Color(0xff1e1e1e),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 30,
                                color: Color(0xff32793d),
                              ),
                              Spacer(),
                              Text(
                                'Пополнить',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xfff4f4f4)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text('с любых карт \nи счетов',
                                  style: TextStyle(
                                      color: Color(0xff898989), fontSize: 12))
                            ]),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: const Color(0xff1e1e1e),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list_alt_sharp,
                                size: 30,
                                color: Color(0xff32793d),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'О карте',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xfff4f4f4)),
                              ),
                            ]),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: const Color(0xff1e1e1e),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                size: 30,
                                color: Color(0xff32793d),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Настройки',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xfff4f4f4)),
                              ),
                            ]),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AboutCardsData extends StatefulWidget {
  final String numberCards;
  final String dateCards;
  final String balance;
  final Color bacgcolor;
  const AboutCardsData({
    super.key,
    required this.numberCards,
    required this.dateCards,
    required this.bacgcolor,
    required this.balance,
  });

  @override
  State<AboutCardsData> createState() => _AboutCardsDataState();
}

class _AboutCardsDataState extends State<AboutCardsData> {
  bool isCardNumberHidden = true;
  bool isCardCvcHidden = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 230,
      decoration: BoxDecoration(
          color: widget.bacgcolor, borderRadius: BorderRadius.circular(15)),
      child: LoadingOverlay(
        isLoading: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: isLoading
                        ? Colors.grey.withOpacity(0.2)
                        : const Color(0xff272727),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: isCardNumberHidden
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: '**** **** **** ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xfff4f4f4),
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.numberCards.substring(
                                          widget.numberCards.length - 4),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xfff4f4f4)),
                                    ),
                                  ],
                                ),
                              )
                            : Text(
                                widget.numberCards,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xfff4f4f4)),
                              )),
                    const Spacer(),
                    !isCardNumberHidden
                        ? IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xff939393),
                              size: 23,
                              weight: 15,
                            ),
                            onPressed: () {
                              setState(() {
                                isCardNumberHidden = !isCardNumberHidden;
                                isLoading = true;
                              });
                              Future.delayed(const Duration(seconds: 1), () {
                                setState(() {
                                  isLoading =
                                      false; // После одной секунды снимаем флаг загрузки
                                });
                              });
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                if (isCardCvcHidden == false) {
                                  isCardCvcHidden = !isCardCvcHidden;
                                  isCardNumberHidden = !isCardNumberHidden;
                                  isLoading =
                                      true; // Toggle visibility of card number
                                } else if (isCardCvcHidden == true) {
                                  isCardNumberHidden = !isCardNumberHidden;
                                  isLoading = true;
                                }
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    isLoading =
                                        false; // После одной секунды снимаем флаг загрузки
                                  });
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.copy_all_rounded,
                              color: Color(0xff189235),
                              size: 23,
                              weight: 15,
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 105,
                    decoration: BoxDecoration(
                        color: isLoading
                            ? Colors.grey.withOpacity(0.2)
                            : const Color(0xff272727),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8),
                            child: isCardCvcHidden
                                ? RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '***',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xfff4f4f4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const Text(
                                    '343',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Color(0xfff4f4f4)),
                                  )),
                        !isCardCvcHidden
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Color(0xff939393),
                                  size: 23,
                                  weight: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isCardCvcHidden = !isCardCvcHidden;
                                    isLoading = true;
                                  });
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    setState(() {
                                      isLoading =
                                          false; // После одной секунды снимаем флаг загрузки
                                    });
                                  });
                                },
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isCardNumberHidden == false) {
                                      isCardCvcHidden = !isCardCvcHidden;
                                      isCardNumberHidden = !isCardNumberHidden;
                                      isLoading =
                                          true; // Toggle visibility of card number
                                    } else if (isCardNumberHidden == true) {
                                      isCardCvcHidden = !isCardCvcHidden;
                                      isLoading = true;
                                    } // Toggle visibility of card number
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        isLoading =
                                            false; // После одной секунды снимаем флаг загрузки
                                      });
                                    });
                                  });
                                },
                                icon: const Icon(
                                  Icons.copy_all_rounded,
                                  color: Color(0xff189235),
                                  size: 23,
                                  weight: 15,
                                ),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Это CVC2/CVV2-код.',
                        style:
                            TextStyle(color: Color(0xff898989), fontSize: 14),
                      ),
                      Text(
                        'Никому его не сообщайте.',
                        style: TextStyle(color: Color(0xff898989)),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'До ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff939393),
                          ),
                        ),
                        TextSpan(
                          text: widget.dateCards,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xfff4f4f4)),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Можно пользоваться дл 28 февр. 2026 г.',
                    style: TextStyle(color: Color(0xff898989), fontSize: 14),
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

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color:
                  isLoading ? Colors.grey.withOpacity(0.4) : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: child,
        ),
        if (isLoading)
          const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF08A652),
              ),
            ),
          ),
      ],
    );
  }
}
