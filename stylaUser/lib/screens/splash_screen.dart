import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:styla/screens/slider_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          curve: Curves.easeInOut,
          duration: 3000,
          splash: 'assets/logostyla.png',
          nextScreen: SliderScreen(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}
