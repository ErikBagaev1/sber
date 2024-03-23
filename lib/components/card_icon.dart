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
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 84, 88, 103),
                  Color.fromARGB(255, 76, 82, 90),
                  Color.fromRGBO(72, 78, 87, 1),
                  Color.fromRGBO(62, 67, 73, 1),
                  Color.fromRGBO(58, 61, 70, 1),
                ],
              )),
          child: icon,
        ),
      ),
    );
  }
}
