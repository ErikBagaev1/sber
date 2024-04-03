import 'package:flutter/material.dart';
import 'package:sber/models/profile.dart';

class CardBalanceWidget extends StatelessWidget {
  final String balance;
  final CreditCard myCreditCard;
  const CardBalanceWidget({
    super.key,
    required this.myCreditCard,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Кошелёк',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Icon(
                    size: 16,
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.visibility_off,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(width: 17),
        const Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 20,
        )
      ],
    );
  }
}
