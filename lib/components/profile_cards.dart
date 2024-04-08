import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  final String text;
  final String text2;
  final String iconText;
  const ProfileCards(
      {super.key,
      required this.text,
      required this.text2,
      required this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: ClipOval(
                      child: Container(
                          color: const Color(0xFF383838),
                          child: Center(
                              child: Text(
                            iconText,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8c8c8c)),
                          )))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  text2,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              width: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 96, 96, 96),
                    size: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
