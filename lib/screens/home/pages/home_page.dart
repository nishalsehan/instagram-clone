

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/themes/theme_barrel.dart';
import 'package:provider/provider.dart';

List<Color> get getColorsList =>  [ const Color(0xFFbc2a8d),const Color(0xFFfccc63), const Color(0xFFfbad50)];

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                elevation: 0,
                // expandedHeight: 120,
                excludeHeaderSemantics: true,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  // height: 30,
                  width: size.width,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/header-text.svg',
                        height: 40,
                      ),
                      Positioned(
                          right: 0,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/heart-outline.svg',
                                height: 28,
                              ),
                              const SizedBox(width: 24),
                              SvgPicture.asset(
                                'assets/icons/message-outline.svg',
                                height: 28,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(index == 0)SizedBox(
                          width: size.width,
                          height: 120,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(6),
                                            height: 95,
                                            child: const ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(10000)),
                                              child: Image(
                                                image: AssetImage(
                                                  'assets/images/profile-image.jpg',
                                                ),
                                                height: 90,
                                              ),
                                            )
                                        ),
                                        Positioned(
                                            bottom: 3,
                                            right: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Theme.of(context).scaffoldBackgroundColor,
                                                    width: 4
                                                  ),
                                                  color: Colors.blue,
                                                  shape: BoxShape.circle
                                              ),
                                              padding: const EdgeInsets.all(2),
                                              child: const Icon(
                                                Icons.add,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    Consumer<ThemeNotifier>(
                                        builder: (context, theme, child){
                                          return Text(
                                              'Your story',
                                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: theme.isDark()?Colors.white38:Colors.grey
                                              )
                                          );
                                        }
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index){
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              height: 95,
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                border: GradientBorder(
                                                  width: 3.2,
                                                  borderGradient: LinearGradient(
                                                    colors: getColorsList,
                                                    tileMode: TileMode.repeated,
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    transform: const GradientRotation(0.0),
                                                  ),
                                                ),
                                                borderRadius: BorderRadius.circular(1000),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(2),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(10000)),
                                                  child: Image(
                                                    image: AssetImage(
                                                      'assets/images/profile-image.jpg',
                                                    ),
                                                    height: 90,
                                                  ),
                                                ),
                                              )
                                          ),
                                          const SizedBox(height: 2),
                                          SizedBox(
                                            width: 95,
                                            child: Text(
                                                'Your story',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                    fontWeight: FontWeight.w400
                                                )
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 14,
                                      );
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Item $index'),
                        )
                      ],
                    );
                  },
                  childCount: 50, // Adjust this according to your needs
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class GradientBorder extends Border {
  final Gradient borderGradient;
  final double width;

  const GradientBorder({
    this.width = 0.0,
    required this.borderGradient,
  }) : super();

  @override
  void paint(
      Canvas canvas,
      Rect rect, {
        TextDirection? textDirection,
        BoxShape shape = BoxShape.rectangle,
        BorderRadius? borderRadius,
      }) {
    if (isUniform) {
      switch (shape) {
        case BoxShape.circle:
          assert(
          borderRadius == null,
          'A borderRadius can only be given for rectangular boxes.',
          );
          _paintGradientBorderWithCircle(canvas, rect);
          break;
        case BoxShape.rectangle:
          if (borderRadius != null) {
            _paintGradientBorderWithRadius(canvas, rect, borderRadius);
            return;
          }
          _paintGradientBorderWithRectangle(canvas, rect);
          break;
      }
      return;
    }
  }

  void _paintGradientBorderWithRadius(
      Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final Paint paint = Paint();
    final RRect outer = borderRadius.toRRect(rect);

    paint.shader = borderGradient.createShader(outer.outerRect);

    if (width == 0.0) {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.0;
      canvas.drawRRect(outer, paint);
    } else {
      final RRect inner = outer.deflate(width);
      canvas.drawDRRect(outer, inner, paint);
    }
  }

  void _paintGradientBorderWithCircle(Canvas canvas, Rect rect) {
    final double radius = (rect.shortestSide - width) / 2.0;
    final Paint paint = Paint();
    paint
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..shader = borderGradient
          .createShader(Rect.fromCircle(center: rect.center, radius: radius));

    canvas.drawCircle(rect.center, radius, paint);
  }

  void _paintGradientBorderWithRectangle(Canvas canvas, Rect rect) {
    final Paint paint = Paint();
    paint
      ..strokeWidth = width
      ..shader = borderGradient.createShader(rect)
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect.deflate(width / 2.0), paint);
  }

  factory GradientBorder.uniform({
    Gradient gradient = const LinearGradient(colors: [Color(0x00000000)]),
    double width = 1.0,
  }) {
    return GradientBorder._fromUniform(gradient, width);
  }

  const GradientBorder._fromUniform(Gradient gradient, this.width)
      : assert(width >= 0.0),
        borderGradient = gradient;
}