import 'package:flutter/material.dart';

class AboutCards extends StatefulWidget {
  const AboutCards({super.key});

  @override
  State<AboutCards> createState() => _AboutCardsState();
}

class _AboutCardsState extends State<AboutCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfff4f4f4)),
        backgroundColor: const Color(0xFF121212),
        title: const Text(
          'MIR',
          style:
              TextStyle(color: Color(0xfff4f4f4), fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          const SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, right: 8),
              child: AboutCardsData(
                bacgcolor: Color(0xff1e1e1e),
                numberCards: '8921 2123 4213 2345',
                dateCards: '02/2026',
              ),
            ),
          ),
          const SizedBox(
            height: 100,
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
  final Color bacgcolor;
  const AboutCardsData({
    super.key,
    required this.numberCards,
    required this.dateCards,
    required this.bacgcolor,
  });

  @override
  State<AboutCardsData> createState() => _AboutCardsDataState();
}

class _AboutCardsDataState extends State<AboutCardsData> {
  bool isCardNumberHidden = false;
  bool isCardCvcHidden = false;
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
              )
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
