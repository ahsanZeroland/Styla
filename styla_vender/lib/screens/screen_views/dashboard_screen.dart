import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:styla_vender/constants/color_constants.dart';
//import 'package:styla_vender/screens/widgets/bar_chart_widget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Color leftBarColor = const Color(0xffff5182);
  final Color rightBarColor = const Color(0xff53fdd7);
  final double width = 7;
  int touchedGroupIndex;
  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: buildAppDrawer(context),
      body: Column(
        children: [
          ///Appbar starts.........
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _key.currentState.openDrawer(); // this opens drawer
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome',
                              // style: TextStyle(),
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ahmad',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.message_outlined,
                    )
                  ],
                ),
              ),
              flex: 2),

          ///AppBar Ends............
          ///Graph Card Starts.......................
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.red.shade400,
                                      height: 5,
                                      width: 28,
                                    ),
                                    SizedBox(width: 13),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sell',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '\$1320.50',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.green.shade300,
                                      height: 5,
                                      width: 28,
                                    ),
                                    SizedBox(width: 13),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Profit',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '\$420.50',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            flex: 3),
                        //TODO yahn kam karna he...........
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey,
                                      getTooltipItem: (_a, _b, _c, _d) => null,
                                    ),
                                    touchCallback: (response) {
                                      if (response.spot == null) {
                                        setState(() {
                                          touchedGroupIndex = -1;
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                        });
                                        return;
                                      }

                                      touchedGroupIndex =
                                          response.spot.touchedBarGroupIndex;

                                      setState(() {
                                        if (response.touchInput
                                                is FlLongPressEnd ||
                                            response.touchInput is FlPanEnd) {
                                          touchedGroupIndex = -1;
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                        } else {
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                          if (touchedGroupIndex != -1) {
                                            double sum = 0;
                                            for (BarChartRodData rod
                                                in showingBarGroups[
                                                        touchedGroupIndex]
                                                    .barRods) {
                                              sum += rod.y;
                                            }
                                            final avg = sum /
                                                showingBarGroups[
                                                        touchedGroupIndex]
                                                    .barRods
                                                    .length;

                                            showingBarGroups[
                                                    touchedGroupIndex] =
                                                showingBarGroups[
                                                        touchedGroupIndex]
                                                    .copyWith(
                                              barRods: showingBarGroups[
                                                      touchedGroupIndex]
                                                  .barRods
                                                  .map((rod) {
                                                return rod.copyWith(y: avg);
                                              }).toList(),
                                            );
                                          }
                                        }
                                      });
                                    }),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (value) => const TextStyle(
                                        color: Color(0xff7589a2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    margin: 20,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Sn';
                                        case 1:
                                          return 'Mn';
                                        case 2:
                                          return 'Tu';
                                        case 3:
                                          return 'Wd';
                                        case 4:
                                          return 'Th';
                                        case 5:
                                          return 'Fr';
                                        case 6:
                                          return 'St';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (value) => const TextStyle(
                                        color: Color(0xff7589a2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    margin: 32,
                                    reservedSize: 14,
                                    getTitles: (value) {
                                      if (value == 0) {
                                        return '1';
                                      } else if (value == 10) {
                                        return '50';
                                      } else if (value == 19) {
                                        return '100';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingBarGroups,
                              ),
                            ),
                          ),
                          flex: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 8),

          ///Graph Card Ends.......................

          ///
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Best Selling Product'),
                      Text('Recent Sell Products')
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 8.0, left: 4.0, right: 4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 100,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            flex: 6,
          ),
          Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Best Selling Product'),
                        Text('Recent Sell Products')
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        padding: EdgeInsets.only(
                          left: 12,
                          right: 12,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, bottom: 8.0, left: 4.0, right: 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: 200,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              flex: 5),
        ],
      ),
    );
  }

  Container buildAppDrawer(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            Container(
              color: AppColor.mainColor,
              height: 160,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    Text(
                      'Ahmad',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logostyla.png',
                          height: 50,
                          width: 50,
                        ),
                        Text('Credit and payment method'),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.2,
                  ),
                ],
              ),
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.person_outline_rounded,
              text: 'Profile',
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.alarm_outlined,
              text: 'Order',
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.track_changes,
              text: 'Tracking',
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.wallet_giftcard,
              text: 'Wallet',
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.voice_chat_rounded,
              text: 'Vouchers',
            ),
            MenuListBar(
              onTap: () {},
              icon: Icons.help_outline,
              text: 'Help Center',
            ),
            SizedBox(height: 5),
            DrawerItem(
              onTap: () {},
              text: 'Settings',
            ),
            DrawerItem(
              onTap: () {},
              text: 'Terms & Conditions/ Privacy',
            ),
            DrawerItem(
              onTap: () {},
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onTap;

  const DrawerItem({Key key, this.text, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class MenuListBar extends StatelessWidget {
  final Function onTap;
  final String text;
  final IconData icon;

  const MenuListBar({Key key, this.onTap, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
