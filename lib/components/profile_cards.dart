import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  final String text;
  final String text2;
  const ProfileCards({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 65,
                width: 65,
                child: ClipOval(
                    child: Container(
                        color: const Color(0xFFEDEFEF),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                        ))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                text2,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.close,
                color: Colors.grey,
                size: 18,
              )
            ],
          ),
        ),
      ],
    );
  }
}
