import 'package:flutter/material.dart';
import 'package:sber/components/Expenses_card.dart';

import 'components/card_balance.dart';
import 'components/card_list.dart';
import 'components/custom_app_bar.dart';
import 'components/translation_cash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Сбербанк',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Сбербанк'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(23),
                        bottomRight: Radius.circular(23),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo[900]!,
                          Colors.indigo[700]!,
                          Colors.indigo[500]!,
                          Colors.indigo[300]!
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 70),
                          child: CardBalanceWidget(),
                        ),
                        CardsList(),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        const TranslationCash(),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Расходы в марте',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Все',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green[700]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        children: [
                                          Expenses(
                                            cash: const Text(
                                              '17 137 ₽',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            cardNumber: Text(
                                              'Все расходы из 6000 ₽',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                            widget: SizedBox(
                                              height: 40,
                                              child: ClipOval(
                                                child: Image.network(
                                                  'https://e7.pngegg.com/pngimages/183/983/png-clipart-computer-icons-user-profile-user-interface-ei-silhouette-user-profile.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          //====================================
                                          Expenses(
                                            cash: Text(
                                              'Перводы людям',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                            cardNumber: const Text(
                                              '10 831 ₽',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            widget: SizedBox(
                                              height: 40,
                                              child: ClipOval(
                                                child: Image.network(
                                                  'https://e7.pngegg.com/pngimages/183/983/png-clipart-computer-icons-user-profile-user-interface-ei-silhouette-user-profile.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),

                                          //====================================
                                          Expenses(
                                            cash: Text(
                                              'Рестораны и кафе',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                            cardNumber: const Text(
                                              '3 045 ₽',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            widget: SizedBox(
                                              height: 40,
                                              child: ClipOval(
                                                child: Image.network(
                                                  'https://e7.pngegg.com/pngimages/183/983/png-clipart-computer-icons-user-profile-user-interface-ei-silhouette-user-profile.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo[900]!,
                    Colors.indigo[800]!,
                    Colors.indigo[700]!,
                    Colors.indigo[600]!
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const CustomAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
