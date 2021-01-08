import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styla_vender/constants/color_constants.dart';
import 'package:styla_vender/screens/splash_screen.dart';
import 'package:styla_vender/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColor.mainColor, // Color for Android
        statusBarBrightness:
            Brightness.light, // Dark == white status bar -- for IOS.
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
