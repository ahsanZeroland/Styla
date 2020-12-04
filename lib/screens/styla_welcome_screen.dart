import 'package:flutter/material.dart';

class StylaWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Text(
          'Welcome to \n Styla',
          style: TextStyle(),
        ),
      ),
    );
  }
}
