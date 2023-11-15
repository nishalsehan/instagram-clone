

import 'package:flutter/material.dart';

const String profileAvatar = 'https://instagram.fcmb1-2.fna.fbcdn.net/v/t51.2885-19/385796460_340793611680426_8122083031362328578_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fcmb1-2.fna.fbcdn.net&_nc_cat=106&_nc_ohc=kWtNem0dSwcAX9kTFt5&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfBAk7O7mTjJ01lzJr6PszNw5ZHl6vKOm46tyzLG7xbQ5Q&oe=655A36AC&_nc_sid=ee9879';

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF8a3ab9), Color(0xFFbc2a8d),Color(0xFFfccc63), Color(0xFFfbad50)],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}