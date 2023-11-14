import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'themes/theme_barrel.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // used a Consumer to listen for Theme changes
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen()
      ),
    );
  }
}