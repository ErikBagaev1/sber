import 'package:flutter/material.dart';

import 'profile_cards.dart';

class TranslationCash extends StatelessWidget {
  const TranslationCash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        SizedBox(
          child: Container(
              width: double.infinity,
              height: 190,
              color: Colors.black87,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Переводы на Сбер',
                          style: TextStyle(
                              letterSpacing: -0.5,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          'Все (19)',
                          style: TextStyle(
                              letterSpacing: -0.5,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF08A652)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 115,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: ClipOval(
                                    child: Container(
                                        color: const Color(0xFF128f2b),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFf7ffff),
                                          size: 25,
                                        ))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Новый',
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const Text(
                                'Перевод',
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const ProfileCards(
                            text: 'Руха',
                            text2: '',
                            iconText: 'Р',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ProfileCards(
                            text: 'Алик',
                            text2: 'Артурович',
                            iconText: 'AР',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ProfileCards(
                            text: 'Kinder',
                            text2: '',
                            iconText: 'K',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ProfileCards(
                            text: 'Taison',
                            text2: '',
                            iconText: 'T',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ProfileCards(
                            text: 'Bagaev',
                            text2: 'Dima',
                            iconText: 'BD',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
