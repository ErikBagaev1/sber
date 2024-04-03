import 'package:flutter/material.dart';
import 'package:sber/theme/colors.dart';

import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  final CreditCard myCreditCard;
  const ProfilePage({super.key, required this.myCreditCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BODY_DARK_GRAY,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfff4f4f4)),
        backgroundColor: BODY_DARK_GRAY,
        actions: const [
          Icon(Icons.settings, size: 30, color: Color(0xfff4f4f4)),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(20)),
                  height: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myCreditCard.name,
                            style: const TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Документы и Сбер ID',
                              style: TextStyle(
                                  color: GREEN_LITE,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              weight: 30,
                              size: 16,
                              Icons.arrow_forward_ios_rounded,
                              color: GREEN_HIGHT,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconCards(
                              color: GREEN_MEDIUM,
                              text: 'Подписки',
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            IconCards(
                              color: BODY_DARK_GRAY,
                              text: 'СберПрайм',
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Color(0xff5b5b5c),
                              ),
                            ),
                            IconCards(
                              color: GREEN_MEDIUM,
                              text: 'Уведомления',
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            IconCards(
                              color: GREEN_MEDIUM,
                              text: 'Страховки',
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: BODY_DARK_GRAY,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Привилегии и сервисы',
                                      style: TextStyle(
                                          color: GREEN_MEDIUM,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 25,
                                          color: GREEN_MEDIUM,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Бонусы и скидки',
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Для тех кто, кто получает зарплату,\nпенсию и соцподдержку',
                                          style: TextStyle(
                                              color: TEXT_GRAY,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Icon(
                                            weight: 30,
                                            size: 16,
                                            Icons.arrow_forward_ios_rounded,
                                            color: TEXT_GRAY,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 50.0, right: 15, top: 5, bottom: 10),
                                child: Divider(
                                  thickness: 0.2,
                                  color: Color(0xFF7d7d7d),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.question_mark_outlined,
                                      size: 25,
                                      color: GREEN_MEDIUM,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Поддержка Сбера',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          weight: 30,
                                          size: 16,
                                          Icons.arrow_forward_ios_rounded,
                                          color: TEXT_GRAY,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffefeff1),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Icon(
                        Icons.person,
                        color: Color(0xffc1c4cc),
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 30),
            child: Text(
              'Что нового',
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

class IconCards extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color color;
  const IconCards({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Padding(padding: const EdgeInsets.all(15.0), child: icon),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
                color: WHITE_TEXT, fontWeight: FontWeight.w400, fontSize: 12),
          )
        ],
      ),
    );
  }
}
