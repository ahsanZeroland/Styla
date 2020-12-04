import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:styla/commons/size_constants.dart';
import 'package:styla/data/models/categoryModel.dart';
import 'package:styla/screens/widgets/global_card_horizontal.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 225.0,
      child: Carousel(
        overlayShadow: true,
        borderRadius: true,
        boxFit: BoxFit.cover,
        autoplay: true,
        dotSize: 5.0,
        // indicatorBgPadding: 9.0,
        images: [
          NetworkImage(
              'https://i.pinimg.com/736x/b8/62/67/b86267a0ac6dd431377aadf6bf455176.jpg'),
          NetworkImage(
              'https://i.pinimg.com/736x/b8/62/67/b86267a0ac6dd431377aadf6bf455176.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1500),
      ),
    );
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: null),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: "WorkSansLight"),
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Search'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.filter_list),
              Text('Just For you'),
              Text('Trending'),
              Text('Discount'),
              Text('Message'),
            ],
          ),
          imageCarousel,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final list = categoryList[index];
                  return GlobalCardHorizontal(
                    width: 100,
                    image: list.picture,
                    title: list.name,
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Top Vendors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  //final list = categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Image.network(
                              'https://images.squarespace-cdn.com/content/v1/5c57b920d7819e0b6bc30526/1549873043331-W3KRZVOYUZ8TZHWVJ3F3/ke17ZwdGBToddI8pDm48kOyctPanBqSdf7WQMpY1FsRZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpwwQIrqN0bcqL_6-iJCOAA0qwytzcs0JTq1XS2aqVbyK6GtMIM7F0DGeOwCXa63_4k/denim+logo+sq.jpg'),
                          Text('denim'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5.0',
                                style: TextStyle(color: Colors.black45),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Others',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.shutterstock.com/image-photo/wardrobe-stylish-girls-clothes-hanging-600w-1241675746.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('20% OFF EVERYTHING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  'Use code styla'.toUpperCase(),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          //TODO kam karna he ....
          Container(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                //final list = categoryList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          child: Image.network(
                            'https://inspire-shoots.com/wp-content/uploads/2020/10/Stil-FW-Poster-copy.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text('denim'),
                      Text(
                        '\$ 20.00',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 10.0,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            '(2)',
                            style: TextStyle(
                                fontSize: 8.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.shutterstock.com/image-photo/wardrobe-stylish-girls-clothes-hanging-600w-1241675746.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View all',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
