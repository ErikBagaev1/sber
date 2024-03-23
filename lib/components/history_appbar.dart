import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF435063),
              Color.fromARGB(255, 60, 69, 81),
              Color.fromARGB(255, 57, 66, 77),
              Color.fromARGB(255, 57, 66, 73),
              Color(0xFF333A45),
              Color(0xFF2F343C),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
