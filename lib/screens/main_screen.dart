import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styla/screens/PageViews/main_home_screen.dart';

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
          // Container(child: ProfileScreen())
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              buildBottomNavigationBarItems(_labelFontSize, 0, Icons.chat),
              buildBottomNavigationBarItems(_labelFontSize, 1, Icons.call),
              buildBottomNavigationBarItems(
                  _labelFontSize, 2, Icons.contact_phone),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItems(
      double _labelFontSize, int page, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: (_page == page) ? Colors.black : Colors.grey),
    );
  }
}
