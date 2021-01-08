import 'package:flutter/material.dart';
import 'package:styla_vender/constants/color_constants.dart';
import 'package:styla_vender/constants/radius_constants.dart';
import 'package:styla_vender/screens/screen_views/dashboard_screen.dart';
import 'package:styla_vender/screens/screen_views/profile_screen.dart';
import 'package:styla_vender/screens/screen_views/search_screen.dart';
import 'package:styla_vender/screens/screen_views/wallet_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    DashboardScreen(),
    SearchScreen(),
    ProfileScreen(),
    WalletScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardScreen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.mainColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RadiusConstants.circularRadius),
              topRight: Radius.circular(RadiusConstants.circularRadius),
            ),
            child: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        child: Icon(
          Icons.add,
          size: 27,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            DashboardScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.explore,
                          size: currentTab == 0 ? 28 : 24,
                          color: currentTab == 0
                              ? AppColor.mainColor
                              : Colors.black,
                        ),
                        Text(
                          'Explore',
                          style: TextStyle(
                            fontWeight: currentTab == 0
                                ? FontWeight.w500
                                : FontWeight.w300,
                            fontSize: currentTab == 0 ? 12 : 11,
                            color: currentTab == 0
                                ? AppColor.mainColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            SearchScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search_outlined,
                          size: currentTab == 1 ? 28 : 24,
                          color: currentTab == 1
                              ? AppColor.mainColor
                              : Colors.black,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontWeight: currentTab == 1
                                ? FontWeight.w500
                                : FontWeight.w300,
                            fontSize: currentTab == 1 ? 12 : 11,
                            color: currentTab == 1
                                ? AppColor.mainColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: currentTab == 2 ? 28 : 24,
                          color: currentTab == 2
                              ? AppColor.mainColor
                              : Colors.black,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: currentTab == 2
                                ? FontWeight.w500
                                : FontWeight.w300,
                            fontSize: currentTab == 2 ? 12 : 11,
                            color: currentTab == 2
                                ? AppColor.mainColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            WalletScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket_outlined,
                          size: currentTab == 3 ? 28 : 24,
                          color: currentTab == 3
                              ? AppColor.mainColor
                              : Colors.black,
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                            fontWeight: currentTab == 3
                                ? FontWeight.w500
                                : FontWeight.w300,
                            fontSize: currentTab == 3 ? 12 : 11,
                            color: currentTab == 3
                                ? AppColor.mainColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
