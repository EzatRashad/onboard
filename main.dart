import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dress_onboarding/modules/onboardig/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.contain,
          height: 125,
          width: 230,
          alignment: Alignment.center,
        ),
        backgroundColor: const Color(0xff2e3f47),
        splashIconSize: double.infinity,
        nextScreen: const Onbarding(),
      ),
    );
  }
}
