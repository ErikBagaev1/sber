import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber/pages/profile_page.dart';

import '../models/profile.dart';

class CustomAppBar extends StatelessWidget {
  final CreditCard myCreditCard;
  const CustomAppBar({super.key, required this.myCreditCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ProfilePage(
                    myCreditCard: myCreditCard,
                  ),
                  transitionDuration: const Duration(
                      milliseconds: 200), // Длительность анимации
                  reverseTransitionDuration: const Duration(
                      milliseconds:
                          200), // Длительность обратной анимации при возврате
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeOutCubic; // Кривая анимации
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: SizedBox(
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
