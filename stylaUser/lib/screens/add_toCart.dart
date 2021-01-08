import 'package:flutter/material.dart';
import 'package:styla/data/models/productModel.dart';
import 'package:styla/screens/themes/color_theme.dart';

class AddTOCArt extends StatefulWidget {
  @override
  _AddTOCArtState createState() => _AddTOCArtState();
}

class _AddTOCArtState extends State<AddTOCArt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 1.0,
            child: Container(
              color: AppColor.mainColor,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    Text(
                      'My Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_sweep,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.84,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
              child: Container(
                color: Colors.grey.shade300,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  width: 110,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: product.color,
                                      ),
                                      CircleAvatar(
                                        radius: 36,
                                        backgroundColor: Colors.white,
                                      ),
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundColor: product.color,
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: -0.1,
                                        child: Image.asset(
                                          product.image,
                                          width: 80,
                                          height: 80,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.title,
                                        style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          child: Icon(
                                            Icons.dashboard_outlined,
                                            size: 10,
                                            color: AppColor.mainColor,
                                          ),
                                          height: 15,
                                          width: 12,
                                        ),
                                        Text(
                                          product.price.toString(),
                                          style: TextStyle(
                                              color: AppColor.mainColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 21),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
