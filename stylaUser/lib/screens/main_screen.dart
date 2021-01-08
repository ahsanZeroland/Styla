import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styla/screens/PageViews/main_home_screen.dart';
import 'package:styla/screens/PageViews/profile_screen.dart';
import 'package:styla/screens/themes/color_theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(child: MainHomeScreen()),
          Center(
              child: Text('call log screen....',
                  style: TextStyle(color: Colors.black))),
          // Container(child: CategoryPage()),
          Center(
              child: Text('call logssssss screen....',
                  style: TextStyle(color: Colors.black))),

          Center(
              child: Text('call logssssss screen....',
                  style: TextStyle(color: Colors.black))),
          Container(
            child: ProfileScreen(),
          )
          // Container(child: ProfileScreen())
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItems(
                _labelFontSize, 0, 'assets/logopngs/clock.png', 'explore'),
            buildBottomNavigationBarItems(
                _labelFontSize, 1, 'assets/logopngs/add-to-basket.png', 'cart'),
            buildBottomNavigationBarItems(
                _labelFontSize, 2, 'assets/logopngs/loupe.png', 'search'),
            buildBottomNavigationBarItems(
                _labelFontSize, 3, 'assets/logopngs/message.png', 'message'),
            buildBottomNavigationBarItems(
                _labelFontSize, 4, 'assets/logopngs/user.png', 'profile'),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItems(
      double _labelFontSize, int page, String icon, String text) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ImageIcon(
                AssetImage(icon),
                color: (_page == page) ? AppColor.mainColor : Colors.black,
                size: 40,
              ),
            ),
          ),
          SizedBox(
            height: 15,
            child: Text(
              text,
              style: TextStyle(
                  color: (_page == page) ? AppColor.mainColor : Colors.black,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
