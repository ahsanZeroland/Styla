import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:styla/data/models/slider.dart';
import 'package:styla/screens/login_screen.dart';
import 'package:styla/screens/themes/color_theme.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Keep",
        description:
            "Accept cryptocurrencies and digital assets, keep thern here, or send to orthers",
        image: "assets/sliderone.png"),
    SliderPage(
        title: "Buy",
        description:
            "Buy Bitcoin and cryptocurrencies with VISA and MasterVard right in the App",
        image: "assets/slidertwo.png"),
    SliderPage(
        title: "Sell",
        description:
            "Sell your Bitcoin cryptocurrencies or Change with orthres digital assets or flat money",
        image: "assets/sliderthree.png"),
    SliderPage(
        title: "Throw",
        description:
            "Sell your Bitcoin cryptocurrencies throwing your work out of the application",
        image: "assets/sliderfour.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _onchanged,
                  controller: _controller,
                  itemCount: _pages.length,
                  itemBuilder: (context, int index) {
                    return _pages[index];
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        (_currentPage == (_pages.length - 1))
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()))
                            : _controller.nextPage(
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeInOutQuint);
                      },
                      child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 300),
                          height: 55,
                          width:
                              (_currentPage == (_pages.length - 1)) ? 200 : 150,
                          decoration: BoxDecoration(
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.circular(35)),
                          child: (_currentPage == (_pages.length - 1))
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
                                )),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 10,
                              width: (index == _currentPage) ? 30 : 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? AppColor.mainColor
                                      : AppColor.shadeColor));
                        })),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
