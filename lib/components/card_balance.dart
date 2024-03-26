import 'package:flutter/material.dart';

class CardBalanceWidget extends StatelessWidget {
  const CardBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
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
                const Text(
                  '10 303, 32 ₽',
                  style: TextStyle(
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
        const Icon(Icons.visibility_off, color: Colors.white),
        const SizedBox(width: 15),
        const Icon(Icons.more_horiz, color: Colors.white)
      ],
    );
  }
}
