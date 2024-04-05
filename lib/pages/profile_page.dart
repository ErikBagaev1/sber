import 'package:flutter/material.dart';
import 'package:sber/pages/number_page.dart';
import 'package:sber/theme/colors.dart';

import '../animation/sceleton.dart';
import '../models/profile.dart';

class ProfilePage extends StatefulWidget {
  final CreditCard myCreditCard;
  const ProfilePage({super.key, required this.myCreditCard});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      extendBodyBehindAppBar: true,
      backgroundColor: BODY_DARK_GRAY,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
        primary: false,
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
                            widget.myCreditCard.name,
                            style: const TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        NumberPage(
                                      myCreditCard: widget.myCreditCard,
                                    ),
                                    transitionDuration: const Duration(
                                        milliseconds:
                                            200), // Длительность анимации
                                    reverseTransitionDuration: const Duration(
                                        milliseconds:
                                            200), // Длительность обратной анимации при возврате
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(0.0, 1.0);
                                      const end = Offset.zero;
                                      const curve = Curves
                                          .easeOutCubic; // Кривая анимации
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                'Документы и Сбер ID',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: GREEN_MEDIUM,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              size: 16,
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 57, 150, 61),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SkeletonIconContainer(
                                      width: 70,
                                      height: 70,
                                      borderRadius: BorderRadius.circular(20),
                                      text: '',
                                      style: const TextStyle(),
                                    ),
                                    SkeletonIconContainer(
                                      width: 70,
                                      height: 70,
                                      borderRadius: BorderRadius.circular(20),
                                      text: '',
                                      style: const TextStyle(),
                                    ),
                                    SkeletonIconContainer(
                                      width: 70,
                                      height: 70,
                                      borderRadius: BorderRadius.circular(20),
                                      text: '',
                                      style: const TextStyle(),
                                    ),
                                    SkeletonIconContainer(
                                      width: 70,
                                      height: 70,
                                      borderRadius: BorderRadius.circular(20),
                                      text: '',
                                      style: const TextStyle(),
                                    ),
                                  ],
                                )
                              : const Row(
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
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Center(
                                            child: IconCards(
                                              color: BODY_DARK_GRAY,
                                              text: 'СберПрайм',
                                              icon: Icon(
                                                Icons.back_hand_outlined,
                                                size: 30,
                                                color: Color(0xff5b5b5c),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 12.0,
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: GREEN_MEDIUM,
                                              radius: 12,
                                              child: Icon(
                                                size: 17,
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconCards(
                                      color: GREEN_MEDIUM,
                                      text: 'Уведомления',
                                      icon: Icon(
                                        Icons.paid_rounded,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconCards(
                                      color: GREEN_MEDIUM,
                                      text: 'Страховки',
                                      icon: Icon(
                                        Icons.network_check_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: BODY_DARK_GRAY,
                              borderRadius: BorderRadius.circular(10)),
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
                                          letterSpacing: -0.5,
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
                                              letterSpacing: -0.5,
                                              color: Color(0xffffffff),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Для тех кто, кто получает зарплату,\nпенсию и соцподдержку',
                                          style: TextStyle(
                                              letterSpacing: -0.5,
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
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SkeletonIconContainer(
                            width: 250,
                            height: 195,
                            borderRadius: BorderRadius.circular(20),
                            text: '',
                            style: const TextStyle(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SkeletonIconContainer(
                            width: 250,
                            height: 195,
                            borderRadius: BorderRadius.circular(20),
                            text: '',
                            style: const TextStyle(),
                          ),
                          SkeletonIconContainer(
                            width: 250,
                            height: 195,
                            borderRadius: BorderRadius.circular(20),
                            text: '',
                            style: const TextStyle(),
                          ),
                          SkeletonIconContainer(
                            width: 70,
                            height: 70,
                            borderRadius: BorderRadius.circular(20),
                            text: '',
                            style: const TextStyle(),
                          ),
                        ],
                      )
                    : const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          WhatNew(
                            textWhite:
                                'Приложения СберБанк \nОнлайн помогут установит...',
                            textGray: '26 марта * читать 2 минуты',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          WhatNew(
                            textWhite:
                                'Приложения СберБанк \nОнлайн помогут установит...',
                            textGray: '26 марта * читать 2 минуты',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          WhatNew(
                            textWhite:
                                'Приложения СберБанк \nОнлайн помогут установит...',
                            textGray: '26 марта * читать 2 минуты',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          WhatNew(
                            textWhite:
                                'Приложения СберБанк \nОнлайн помогут установит...',
                            textGray: '26 марта * читать 2 минуты',
                          ),
                        ],
                      )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 30),
            child: Text(
              'Близкие',
              style: TextStyle(
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff333132),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: BODY_DARK_GRAY,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.add_rounded,
                              size: 25,
                              color: GREEN_MEDIUM,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Добавьте близких, с которыми хотите \nвести общий бюджет или защитить \nих от мошенников',
                          style: TextStyle(
                              letterSpacing: -0.5,
                              color: TEXT_GRAY,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
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

class WhatNew extends StatelessWidget {
  final String textWhite;
  final String textGray;

  const WhatNew({
    super.key,
    required this.textWhite,
    required this.textGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff333132),
          borderRadius: BorderRadiusDirectional.circular(15)),
      height: 260,
      width: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: GREEN_LITE,
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(15),
                    topStart: Radius.circular(15))),
            height: 125,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              textWhite,
              style: const TextStyle(
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              textGray,
              style: const TextStyle(
                  letterSpacing: -0.5,
                  color: TEXT_GRAY,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
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
                letterSpacing: -0.5,
                color: WHITE_TEXT,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
