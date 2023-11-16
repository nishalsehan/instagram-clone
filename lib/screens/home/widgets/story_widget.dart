

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class StoryWidget extends StatelessWidget{
  final EdgeInsets padding;
  final String url;

  const StoryWidget({super.key, required this.padding, required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: randomGradient(),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: size.width - 2,
      height: size.height - padding.top - padding.bottom - size.height*0.09,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Color randomColor() {
    Random random = Random();
    return HSLColor.fromAHSL(
      1.0,
      random.nextDouble() * 360, // Hue
      random.nextDouble() * 0.5 + 0.5, // Saturation (ensuring it's relatively saturated)
      random.nextDouble() * 0.2 + 0.8, // Lightness (ensuring it's relatively light)
    ).toColor();
  }

  Gradient randomGradient() {
    List<Color> list = [randomColor(), randomColor()];
    // list.sort();
    return LinearGradient(
      colors: list,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}