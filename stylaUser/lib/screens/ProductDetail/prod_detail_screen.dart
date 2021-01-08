import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styla/data/models/productModel.dart';
import 'package:styla/screens/ProductDetail/components/add_to_cart.dart';
import 'package:styla/screens/ProductDetail/components/color_and_size.dart';
import 'package:styla/screens/ProductDetail/components/counter_with_fav_button.dart';
import 'package:styla/screens/ProductDetail/components/product_title_with_image.dart';
import 'package:styla/screens/add_to_cart_screen.dart';

import '../add_toCart.dart';
import 'components/description.dart';
//import 'package:styla/screens/themes/color_theme.dart';

class ProdDetailScreen extends StatefulWidget {
  final Product product;

  const ProdDetailScreen({Key key, this.product}) : super(key: key);
  @override
  _ProdDetailScreenState createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
        backgroundColor: widget.product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/svgs/back.svg',
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/search.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/cart.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Body(product: widget.product),
    );
  }
}

class Body extends StatelessWidget {
  final Product product;
  const Body({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.32),
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    left: 10,
                    right: 10,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: 30),
                      Description(product: product),
                      SizedBox(height: 20 / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: 20 / 2),
                      AddToCart(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTOCArt(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
