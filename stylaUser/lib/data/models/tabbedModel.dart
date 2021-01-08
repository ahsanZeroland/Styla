import 'package:flutter/cupertino.dart';

class Tab {
  int index;
  String title;

  Tab({@required this.index, @required this.title});
}

class MovieTabbedConstants {
  static List<Tab> movieTabs = [
    Tab(index: 0, title: 'Just For You'),
    Tab(index: 1, title: 'Trending'),
    Tab(index: 2, title: 'Discount'),
    Tab(index: 3, title: 'Latest'),
  ];
}

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({Key key, this.title, this.onTap, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
