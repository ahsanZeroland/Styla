import 'package:flutter/cupertino.dart';
import 'package:styla/screens/themes/color_theme.dart';

class Product {
  final String image, title, desc;
  final int size, id, quantity;
  final double price;
  final Color color;

  Product({
    this.image,
    this.quantity,
    this.title,
    this.desc,
    this.size,
    this.id,
    this.price,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      desc: dummyText,
      image: "assets/bag_1.png",
      color: AppColor.mainColor),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 130,
      size: 8,
      desc: dummyText,
      image: "assets/bag_2.png",
      color: AppColor.mainColor),
  Product(
      id: 3,
      title: "Hang Top",
      price: 99,
      size: 10,
      desc: dummyText,
      image: "assets/bag_3.png",
      color: AppColor.mainColor),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 312,
      size: 11,
      desc: dummyText,
      image: "assets/bag_4.png",
      color: AppColor.mainColor),
  Product(
      id: 5,
      title: "Office Code",
      price: 158,
      size: 12,
      desc: dummyText,
      image: "assets/bag_5.png",
      color: AppColor.mainColor),
  Product(
    id: 6,
    title: "Office Code",
    price: 55,
    size: 12,
    desc: dummyText,
    image: "assets/bag_6.png",
    color: AppColor.mainColor,
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
