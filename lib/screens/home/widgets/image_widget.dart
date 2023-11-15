

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatefulWidget{
  final Function() onLiked;
  final List<String> images;
  const ImageWidget({super.key, required this.onLiked, required this.images});

  @override
  State<StatefulWidget> createState() =>ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> rotate;
  late AnimationController controller;
  double scale = 0.0;
  late double _x = 0;
  late double _y = 0;

  bool rotateLeft = true;

  @override
  void initState() {
    super.initState();
    const quick = Duration(milliseconds: 500);
    final scaleTween = Tween(begin: 0.0, end: 1.0);
    controller = AnimationController(duration: quick, vsync: this);
    rotate = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(controller);

    animation = scaleTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    )..addListener(() {
      setState(() => scale = animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTapDown: (details){
        setState(() {
          _x = details.localPosition.dx - 35;
          _y = details.localPosition.dy - 35;
        });
        widget.onLiked();
        _animate();
        rotateLeft = !rotateLeft;
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: widget.images.first,
            fit: BoxFit.fitWidth,
            fadeInDuration: const Duration(milliseconds: 500),
            width: size.width,
            placeholderFadeInDuration: const Duration(milliseconds: 0),
            progressIndicatorBuilder: (_,__,___){
              return SizedBox(
                width: size.width,
                height: size.width*0.6,
              );
            },
          ),
          Positioned(
              left: _x,
              top: _y,
              child: Transform.scale(
                  scale: scale,
                  child: Transform(
                    transform: Matrix4.rotationZ(rotateLeft? rotate.value: - rotate.value),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/heart-filled.svg',
                      // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.srcIn),
                      height: 90,
                      width: 90,
                    ),
                  )
              )
          )
        ],
      ),
    );
  }


  void _animate() {
    animation
        .addStatusListener((AnimationStatus status) {
      if (scale == 1.0) {
        controller.reset();
      }
    });
    controller.forward();
  }
}