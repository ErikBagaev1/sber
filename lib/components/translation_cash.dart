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
              height: 230,
              color: Colors.black87,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Text(
                          'Переводы на Сбер',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          'Все (19)',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[700]),
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
                      height: 135,
                      child: Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            ProfileCards(
                              text: 'Новый ',
                              text2: 'перевод',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ProfileCards(
                              text: 'Erik',
                              text2: 'Bagaev',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ProfileCards(
                              text: 'Erik',
                              text2: 'Bagaev',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ProfileCards(
                              text: 'Erik',
                              text2: '',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ProfileCards(
                              text: 'Erik',
                              text2: 'Bagaev',
                            ),
                          ],
                        ),
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
