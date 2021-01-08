import 'package:flutter/material.dart';

class GlobalCardHorizontal extends StatelessWidget {
  final double width;
  final String image;
  final String title;
  final Function onTap;

  GlobalCardHorizontal({
    this.width,
    this.image,
    this.title,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loader.gif',
                    image: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
