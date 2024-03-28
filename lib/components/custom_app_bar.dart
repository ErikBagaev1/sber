import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: ClipOval(
                child: Container(
                    color: const Color(0xFFEDEFEF),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFFc1c4c9),
                    ))),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Поиск',
                  isDense: true,
                  hintStyle:
                      const TextStyle(color: Color(0xFFB3BDC6), fontSize: 14),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(0, 0, 0, 0.4)),
            ),
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            'assets/Flag.svg',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 15),
          SvgPicture.asset(
            'assets/Окно.svg',
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
