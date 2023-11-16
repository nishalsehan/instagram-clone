

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatefulWidget{
  final Function() onLiked;
  final Function(int) onScroll;
  final List<String> images;
  const ImageWidget({super.key, required this.onLiked, required this.images, required this.onScroll});

  @override
  State<StatefulWidget> createState() =>ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> rotate;
  late AnimationController controller;
  CarouselController? carouselController = CarouselController();
  double scale = 0.0;
  late double _x = 0;
  late double _y = 0;

  double? aspectRatio;

  bool rotateLeft = true;
  Size size = Size.zero;

  int currentImage = 0;

  @override
  void initState() {
    super.initState();
    getImageSize();
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
    size = MediaQuery.of(context).size;
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
          CarouselSlider(
            items: widget.images.map((e) => CachedNetworkImage(
              imageUrl: e,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              width: size.width,
              placeholderFadeInDuration: const Duration(milliseconds: 0),
              progressIndicatorBuilder: (_,__,___){
                return SizedBox(
                  width: size.width,
                  height: size.width*0.6,
                );
              },
            )
            ).toList(),
            options: CarouselOptions(
                aspectRatio: aspectRatio??size.width/(size.width*0.6),
                enableInfiniteScroll: false,
                onPageChanged: (index,__){
                  widget.onScroll(index);
                  setState(() {
                    currentImage = index;
                  });
                },
                viewportFraction: 1
            ),
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
          ),
          if(widget.images.length > 1)Positioned(
            right: 12,
            top: 12,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
              child: Text(
                '${currentImage + 1}/${widget.images.length}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white
                ),
              ),
            ),
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

  void getImageSize() async {
    final image = NetworkImage(widget.images.first);
    final ImageStream stream = image.resolve(ImageConfiguration.empty);

    // Wait for the image to be fully loaded
    stream.addListener(ImageStreamListener((ImageInfo info, bool synchronousCall) {
      // Update the image height
      setState(() {
        aspectRatio =  info.image.width.toDouble()/info.image.height.toDouble();
      });
    }));
  }
}