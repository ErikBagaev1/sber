import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.transparent
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFF3E4E5E),
            //     Color(0xFF3E4E5E),
            //     Color(0xFF272E38),
            //     Color.fromARGB(255, 35, 42, 51),
            //     Color(0xFF1E1F21),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomCenter,
            // ),
            ),
        child: Padding(
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
                      hintStyle: const TextStyle(
                          color: Color(0xFFB3BDC6), fontSize: 14),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.4)),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ));
  }
}
