import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:styla/data/models/productModel.dart';
import 'package:styla/screens/ProductDetail/prod_detail_screen.dart';
import 'package:styla/screens/themes/color_theme.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 225.0,
      child: Carousel(
        overlayShadow: false,

        dotColor: Colors.white,
        dotBgColor: Colors.transparent,
        dotIncreaseSize: 1.2,
        dotIncreasedColor: AppColor.mainColor,
        borderRadius: true,
        boxFit: BoxFit.cover,
        autoplay: true,
        dotSize: 8.0,
        // indicatorBgPadding: 9.0,
        images: [
          Stack(
            children: <Widget>[
              Image(
                width: double.infinity,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/b8/62/67/b86267a0ac6dd431377aadf6bf455176.jpg'),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Own your Porsche\nToday.',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 35,
                    width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Image(
                width: double.infinity,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/b8/62/67/b86267a0ac6dd431377aadf6bf455176.jpg'),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Own your Porsche\nToday.',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 35,
                    width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Image(
                width: double.infinity,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/b8/62/67/b86267a0ac6dd431377aadf6bf455176.jpg'),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Own your Porsche\nToday.',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 35,
                    width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1500),
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      key: _key,
      drawer: buildAppDrawer(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _key.currentState.openDrawer();
                        }),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                  width: 1.3,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "WorkSansLight"),
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: 'Search'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.filter_list),
                      Text(
                        'Just For you',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Trending',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                imageCarousel,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 134,
                      child: Row(
                        children: [
                          SexCateorySelection(
                              onTap: () {},
                              picture: 'assets/men.PNG',
                              title: 'Men'),
                          SexCateorySelection(
                              onTap: () {},
                              picture: 'assets/women.PNG',
                              title: 'Women'),
                          SexCateorySelection(
                              onTap: () {},
                              picture: 'assets/kid.PNG',
                              title: 'Kids'),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Top Vendors',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
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
                                SizedBox(height: 6),
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
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Others',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 350,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      //final list = categoryList[index];

                      return ProductCard(
                        product: products[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdDetailScreen(
                                product: products[index],
                              ),
                            ),
                          );
                        },
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
          ),
        ),
      ),
    );
  }

  Container buildAppDrawer(BuildContext context) {
    return Container(
      color: AppColor.mainColor,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
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
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductCard({
    this.onTap,
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: product.color,
                child: Hero(
                    tag: "${product.id}", child: Image.asset(product.image)),
                height: 280,
                width: 200,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black45,
              ),
            ),
            Text(
              '\$ ${product.price}',
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
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
                  style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SexCateorySelection extends StatelessWidget {
  final Function onTap;
  final String picture;
  final String title;
  const SexCateorySelection({
    Key key,
    this.onTap,
    this.picture,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(picture)),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
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
