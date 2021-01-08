import 'dart:async';

import 'package:flutter/material.dart';
import 'package:styla_vender/constants/color_constants.dart';
import 'package:styla_vender/constants/radius_constants.dart';
import 'package:styla_vender/models/sliderModel.dart';
import 'package:styla_vender/screens/login_screen.dart';
import 'package:styla_vender/screens/widgets/slide_items.dart';
import 'package:styla_vender/screens/widgets/slider_dots.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 26),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RadiusConstants.circularRadius),
              topRight: Radius.circular(
                RadiusConstants.circularRadius,
              )),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < slideList.length; i++)
                        if (i == _currentPage)
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: InkWell(
                    onTap: () {
                      (_currentPage == (slideList.length - 1))
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            )
                          : _pageController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint,
                            );
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 50,
                      width:
                          (_currentPage == (slideList.length - 1)) ? 190 : 140,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(35)),
                      child: (_currentPage == (slideList.length - 1))
                          ? Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          : Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
