import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/components/card_block.dart';
import 'package:sber/components/card_icon.dart';
import 'package:sber/models/profile.dart';
import 'package:sber/pages/about_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardsList extends StatefulWidget {
  final String balance;
  const CardsList({super.key, required this.balance});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  CreditCard? myCreditCard;
  Future<void> initializeCreditCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myCreditCard = CreditCard.fromSharedPreferences(prefs);
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
    if (myCreditCard == null) {
      // Если myCreditCard еще не инициализирована, показываем индикатор загрузки
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
                  builder: (context) => AboutCards(
                      myCreditCard: myCreditCard!, balance: widget.balance),
                ),
              );
            },
            child: CardBlock(
              widget: SvgPicture.asset(
                'assets/Card.svg',
                width: 30,
              ),
              cash: '${widget.balance} ₽',
              cardNumber:
                  '${(myCreditCard?.provider.length ?? 4) > 6 ? '${myCreditCard?.provider.substring(0, 6)}...' // обрезаем до 6 символов и добавляем многоточие
                      : myCreditCard?.provider} ** ${myCreditCard?.cardNumber.substring((myCreditCard?.cardNumber.length ?? 3) - 4)}',
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
