

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/home/home_barrel.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayNavigation();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: size.height*0.15,
            ),
            Positioned(
              bottom: padding.bottom + size.height*0.01,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height*0.019,
                        color: Colors.black87
                      ),
                    ),
                    Image(
                      image: const AssetImage(
                        'assets/images/meta-logo.png',
                      ),
                      width: size.width*0.25,
                    ),
                  ],
                )
            )
          ],
        ),
      )
    );
  }

  Future<void> _delayNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigate();
  }

  _navigate()  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (route) => const Base())
    );
  }
}