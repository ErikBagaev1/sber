import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ClipOval(
                child: Container(
                    color: const Color(0xFFEDEFEF),
                    child: const Icon(Icons.person))),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle:
                      const TextStyle(color: Color(0xFFB3BDC6), fontSize: 14),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(0, 0, 0, 0.4)),
            ),
          ),
          const SizedBox(width: 20),
          const Icon(
            Icons.flag,
            color: Color(0xFFF0F9FF),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.window_outlined,
            color: Color(0xFFF0F9FF),
          ),
        ],
      ),
    );
  }
}
