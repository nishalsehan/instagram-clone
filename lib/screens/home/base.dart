

import 'package:flutter/material.dart';

import 'home_barrel.dart';

class Base extends StatefulWidget{
  const Base({super.key});

  @override
  State<Base> createState() => BaseState();
}

class BaseState extends State<Base>{

  int currentIndex = 0;
  List screens = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigation(
            index: currentIndex,
            onClick: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        )
    );
  }
}