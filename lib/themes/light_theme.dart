
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
        bodySmall: TextStyle(
            fontSize: 10,
            color: Colors.black54
        ),
        bodyMedium: TextStyle(
            fontSize: 12,
            color: Colors.black54
        ),
        bodyLarge: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.2
        ),
        labelSmall: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            letterSpacing: 0,
            fontWeight: FontWeight.w500
        ),
    )
    // other theme properties
);
