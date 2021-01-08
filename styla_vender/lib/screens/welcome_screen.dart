import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:styla_vender/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
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
          duration: 2000,
          splash: Text(
            'Welcome\nTo Styla   ',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          nextScreen: MainScreen(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}
