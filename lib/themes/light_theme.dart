
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        color: Colors.white
    ),
    fontFamily: 'Instagram-Sans',
    iconTheme: const IconThemeData(
        color: Colors.black
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
    ),
    textTheme: const TextTheme(
        labelSmall: TextStyle(
            fontSize: 10,
            color: Colors.black54
        ),
        labelMedium: TextStyle(
            fontSize: 12,
            color: Colors.black54
        ),
        labelLarge: TextStyle(
            fontSize: 14,
            color: Colors.black87,
        ),
    )
    // other theme properties
);
