import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  final Widget cash;
  final Widget cardNumber;
  final Widget widget;
  const Expenses({
    super.key,
    required this.cash,
    required this.cardNumber,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 160,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget,
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [cash, cardNumber],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
