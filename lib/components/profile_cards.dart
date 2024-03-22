import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://e7.pngegg.com/pngimages/183/983/png-clipart-computer-icons-user-profile-user-interface-ei-silhouette-user-profile.png',
      ),
    );
  }
}
