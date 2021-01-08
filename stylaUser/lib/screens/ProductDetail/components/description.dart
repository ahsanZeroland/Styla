import 'package:flutter/material.dart';
import 'package:styla/data/models/productModel.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        product.desc,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
