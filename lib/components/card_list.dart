import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber/components/card_block.dart';
import 'package:sber/components/card_icon.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
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
          CardBlock(
            widget: SvgPicture.asset(
              'assets/Card.svg',
              width: 30,
            ),
            cash: '10 303, 32  ₽',
            cardNumber: 'Master... ** 1111',
          ),
          const SizedBox(width: 8),
          CardBlock(
            widget: SvgPicture.asset(
              'assets/CardViza.svg',
              width: 30,
            ),
            cash: '7 834, 13 ₽',
            cardNumber: 'MIR ** 2034',
          ),
          const SizedBox(width: 8),
          CardBlock(
            widget: SvgPicture.asset(
              'assets/CardViza.svg',
              width: 30,
            ),
            cash: '7 834, 13S ₽',
            cardNumber: 'MIR ** 2034',
          ),
          const SizedBox(width: 8),
          CardBlock(
            widget: SvgPicture.asset(
              'assets/CardViza.svg',
              width: 30,
            ),
            cash: '7 834, 13S ₽',
            cardNumber: 'MIR ** 2034',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
