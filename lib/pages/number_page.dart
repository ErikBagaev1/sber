import 'package:flutter/material.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/theme/colors.dart';

class NumberPage extends StatelessWidget {
  final CreditCard myCreditCard;
  const NumberPage({super.key, required this.myCreditCard});

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
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xff1e1e1e),
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
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xff1e1e1e),
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
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xff1e1e1e),
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
                                  fontSize: 12))
                        ]),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 80.0, right: 0, top: 5, bottom: 10),
            child: Divider(
              thickness: 0.2,
              color: Color(0xFF7d7d7d),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Row(
              children: [
                Text(
                  'Документы',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: BODY_DARK_GRAY,
                  borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
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
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${myCreditCard.phoneNumber} ',
                          style: const TextStyle(
                              letterSpacing: -0.5,
                              color: Color(0xffffffff),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: GREEN_MEDIUM,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              'Сбер ID',
                              style: TextStyle(color: Color(0xfff8f8f8)),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Уведомления об операциях, вход \nпо Сбер ID',
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
    );
  }
}
