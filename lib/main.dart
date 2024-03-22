import 'package:flutter/material.dart';

import 'components/card_balance.dart';
import 'components/card_list.dart';
import 'components/custom_app_bar.dart';
import 'components/profile_cards.dart';

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                  CustomAppBar(),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 22),
                    child: CardBalanceWidget(),
                  ),
                  CardsList(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 36),
                SizedBox(
                  child: Container(
                      width: double.infinity,
                      height: 200,
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
                            height: 50,
                            child: ProfileCards(),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
