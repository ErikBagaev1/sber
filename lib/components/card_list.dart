import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/components/card_block.dart';
import 'package:sber/components/card_icon.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/pages/about_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  late CreditCard myCreditCard;
  Future<void> initializeCreditCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myCreditCard = CreditCard.fromSharedPreferences(prefs);
      print(myCreditCard.balance);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeCreditCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          const Column(
            children: [
              CardIconWidget(
                svg: 'assets/Component.svg',
              ),
              SizedBox(height: 8),
              CardIconWidget(
                svg: 'assets/Done.svg',
              ),
            ],
          ),
          const SizedBox(width: 8),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutCards(myCreditCard: myCreditCard),
                ),
              );
            },
            child: CardBlock(
              widget: SvgPicture.asset(
                'assets/Card.svg',
                width: 30,
              ),
              cash: '10 303, 32  ₽',
              cardNumber: 'Master... ** 1111',
            ),
          ),
          const SizedBox(width: 8),
          const CardBlock(
            widget: Icon(
              Icons.published_with_changes_outlined,
              color: Colors.green,
              size: 30,
            ),
            cash: '0',
            cardNumber: 'СберСпасибо',
          ),
          const SizedBox(width: 8),
          const CardBlock(
            widget: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
              size: 30,
            ),
            cash: 'Оформить',
            cardNumber: 'карту или счет',
          ),
        ],
      ),
    );
  }
}
