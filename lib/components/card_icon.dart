import 'package:flutter/material.dart';

class CardIconWidget extends StatelessWidget {
  final Icon icon;
  const CardIconWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: icon,
        ),
      ),
    );
  }
}
