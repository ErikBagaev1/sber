import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/animation/sceleton.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/theme/colors.dart';

class NumberPage extends StatefulWidget {
  final CreditCard myCreditCard;
  const NumberPage({super.key, required this.myCreditCard});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Делаем задержку на 2 секунды, затем переключаем isLoading на false
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: GREEN_MEDIUM),
        backgroundColor: BODY_DARK_GRAY,
        title: const Text(
          'Данные',
          style: TextStyle(letterSpacing: -0.5, color: Colors.white),
        ),
      ),
      backgroundColor: BODY_BLACK,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Row(
              children: [
                Text(
                  'Документы',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Spacer(),
                Icon(Icons.add, color: Color(0xFF08A652)),
              ],
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                      color: isLoading
                          ? const Color.fromARGB(255, 49, 49, 49)
                          : const Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            size: 40,
                            color: Color(0xff32793d),
                          ),
                          Spacer(),
                          Text(
                            'Паспорт РФ',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Color(0xfff4f4f4)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('90 17 ****23',
                              style: TextStyle(
                                  color: Color(0xff898989), fontSize: 14))
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                      color: isLoading
                          ? const Color.fromARGB(255, 49, 49, 49)
                          : const Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.list_alt_rounded,
                            size: 40,
                            color: Color(0xff32793d),
                          ),
                          Spacer(),
                          Text(
                            'ИНН',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Color(0xfff4f4f4)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('123121312341',
                              style: TextStyle(
                                  color: Color(0xff898989), fontSize: 14))
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                      color: isLoading
                          ? const Color.fromARGB(255, 49, 49, 49)
                          : const Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            size: 40,
                            color: Color(0xff32793d),
                          ),
                          Spacer(),
                          Text(
                            'Паспорт РФ',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Color(0xfff4f4f4)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('90 17 ****23',
                              style: TextStyle(
                                  letterSpacing: -0.5,
                                  color: Color(0xff898989),
                                  fontSize: 12)),
                        ]),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
            child: Row(
              children: [
                Text(
                  'Госуслуги',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          isLoading
              ? const SizedBox(height: 250, child: SkeletonList())
              : const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.star_border,
                                  size: 35,
                                  color: GREEN_MEDIUM,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Добавить из Госуслуг',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Color(0xffffffff),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'ИНН, СНИЛС, контакты и другие данные',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: TEXT_GRAY,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 80.0, right: 0, top: 5, bottom: 10),
                      child: Divider(
                        thickness: 0.2,
                        color: Color(0xFF7d7d7d),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.accessible_forward,
                                  size: 35,
                                  color: GREEN_MEDIUM,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Регестрация на Госуслугах',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Color(0xffffffff),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Онлайн',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: TEXT_GRAY,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          isLoading
              ? const SizedBox()
              : const Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                      child: Row(
                        children: [
                          Text(
                            'Телефоны',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Icon(Icons.add, color: Color(0xFF08A652)),
                        ],
                      ),
                    ),
                  ],
                ),
          isLoading
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    // height: 180,
                    decoration: BoxDecoration(
                        color: BODY_DARK_GRAY,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Подтвердите номер для уведомлений',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: Color(0xffffffff),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'СМС-коды для покупок и уведомления\nоб операциях будут приходить только \nот него',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: TEXT_GRAY,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Подтвердить',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: GREEN_MEDIUM,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          isLoading
              ? const SizedBox()
              : const SizedBox(
                  height: 20,
                ),
          isLoading
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.phone_android_rounded,
                              size: 35,
                              color: GREEN_MEDIUM,
                            ),
                          ),
                        ],
                      ),
                      isLoading
                          ? const SizedBox()
                          : const SizedBox(
                              width: 10,
                            ),
                      isLoading
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${widget.myCreditCard.phoneNumber} ',
                                      style: const TextStyle(
                                          letterSpacing: -0.5,
                                          color: Color(0xffffffff),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: GREEN_MEDIUM,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          'Сбер ID',
                                          style: TextStyle(
                                              color: Color(0xfff8f8f8)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Уведомления об операциях, вход \nпо Сбер ID',
                                      style: TextStyle(
                                          letterSpacing: -0.5,
                                          color: TEXT_GRAY,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SvgPicture.asset(
                                      'assets/Card.svg',
                                      width: 30,
                                    ),
                                  ],
                                )
                              ],
                            ),
                    ],
                  ),
                ),
          isLoading
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                  child: Row(
                    children: [
                      Text(
                        'Электронная почта',
                        style: TextStyle(
                            letterSpacing: -0.5,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Icon(Icons.add, color: Color(0xFF08A652)),
                    ],
                  ),
                ),
          isLoading
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email_outlined,
                              size: 35,
                              color: GREEN_MEDIUM,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'noutilus_gray@gmail.com',
                        style: TextStyle(
                            letterSpacing: -0.5,
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
          isLoading
              ? const SizedBox()
              : const Padding(
                  padding:
                      EdgeInsets.only(left: 80.0, right: 0, top: 5, bottom: 10),
                  child: Divider(
                    thickness: 0.2,
                    color: Color(0xFF7d7d7d),
                  ),
                ),
          isLoading
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Показать все',
                    style: TextStyle(
                        letterSpacing: -0.7,
                        color: GREEN_MEDIUM,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Row(
              children: [
                Text(
                  'Адреса',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Spacer(),
                Icon(Icons.add, color: Color(0xFF08A652)),
              ],
            ),
          ),
          isLoading
              ? const SizedBox(height: 200, child: SkeletonList())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    // height: 180,
                    decoration: BoxDecoration(
                        color: BODY_DARK_GRAY,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: GREEN_MEDIUM,
                            child: Icon(
                              Icons.list_alt_sharp,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Адрес регистрации',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: Color(0xffffffff),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'СМС-коды для покупок и уведомления\nоб операциях будут приходить только ',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: TEXT_GRAY,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Text(
              'Показать все',
              style: TextStyle(
                  letterSpacing: -0.7,
                  color: GREEN_MEDIUM,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Row(
              children: [
                Text(
                  'Гараж',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Spacer(),
                Icon(Icons.add, color: Color(0xFF08A652)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              // height: 180,
              decoration: BoxDecoration(
                  color: BODY_DARK_GRAY,
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.directions_car,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Добавить транспортное средство',
                      style: TextStyle(
                          letterSpacing: -0.5,
                          color: Color(0xffffffff),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Держите все данные под рукой\nи проверяйте штрафы в приложении',
                      style: TextStyle(
                          letterSpacing: -0.5,
                          color: TEXT_GRAY,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
