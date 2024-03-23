import 'package:flutter/material.dart';
import 'package:sber/components/card_block.dart';
import 'package:sber/components/card_icon.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

bool enabled = false;

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Skeletonizer(
        enabled: enabled,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            SizedBox(width: 16),
            Column(
              children: [
                CardIconWidget(
                  icon: Icon(Icons.qr_code_rounded),
                ),
                SizedBox(height: 8),
                CardIconWidget(
                  icon: Icon(Icons.shield_outlined),
                ),
              ],
            ),
            SizedBox(width: 8),
            CardBlock(
              widget: Icon(Icons.card_giftcard),
              cash: '10 303, 32  ₽',
              cardNumber: 'Master... ** 1111',
            ),
            SizedBox(width: 8),
            CardBlock(
              widget: Icon(Icons.card_giftcard),
              cash: '7 834, 13S ₽',
              cardNumber: 'MIR ** 2034',
            ),
            SizedBox(width: 8),
            CardBlock(
              widget: Icon(Icons.card_giftcard),
              cash: '7 834, 13S ₽',
              cardNumber: 'MIR ** 2034',
            ),
            SizedBox(width: 8),
            CardBlock(
              widget: Icon(Icons.card_giftcard),
              cash: '7 834, 13S ₽',
              cardNumber: 'MIR ** 2034',
            ),
            SizedBox(width: 8),
            CardBlock(
              widget: Icon(Icons.card_giftcard),
              cash: '7 834, 13S ₽',
              cardNumber: 'MIR ** 2034',
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
