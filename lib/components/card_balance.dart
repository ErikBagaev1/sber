import 'package:flutter/material.dart';
import 'package:sber/models/profile.dart';

class CardBalanceWidget extends StatelessWidget {
  final CreditCard myCreditCard;
  const CardBalanceWidget({
    super.key,
    required this.myCreditCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'В кошельке',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '${myCreditCard.balance} ₽',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  size: 16,
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
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
