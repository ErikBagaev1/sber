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
              child: Image.network(
                'https://e7.pngegg.com/pngimages/183/983/png-clipart-computer-icons-user-profile-user-interface-ei-silhouette-user-profile.png',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: const TextStyle(color: Colors.grey),
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
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.window_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
