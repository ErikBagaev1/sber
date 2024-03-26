import 'package:flutter/material.dart';

class CardBlock extends StatelessWidget {
  final String cash;
  final String cardNumber;
  final Widget widget;
  const CardBlock({
    super.key,
    required this.cash,
    required this.cardNumber,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 82, 86, 101),
                Color.fromARGB(255, 67, 72, 79),
                Color.fromRGBO(63, 68, 76, 1),
                Color.fromRGBO(62, 67, 73, 1),
                Color.fromRGBO(58, 61, 70, 1),
              ],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget,
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cash,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                Text(
                  cardNumber,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
