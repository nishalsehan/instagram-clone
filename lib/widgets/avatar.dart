

import 'package:flutter/cupertino.dart';

class Avatar extends StatelessWidget{
  final String url;
  final double size;

  const Avatar({super.key, required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10000)),
      child: Image(
        image: NetworkImage(
          url,
        ),
        fit: BoxFit.cover,
        height: size,
        width: size,
      ),
    );
  }
}