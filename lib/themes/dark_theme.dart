
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    dividerColor: Colors.black12,
    fontFamily: 'Instagram-Sans',
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
    )
    // other theme properties
);