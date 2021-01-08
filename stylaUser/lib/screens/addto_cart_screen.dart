// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CartScreen extends StatelessWidget {
//   static String routeName = "/cart";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: Body(),
//       bottomNavigationBar: CheckoutCard(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: Column(
//         children: [
//           Text(
//             "Your Cart",
//             style: TextStyle(color: Colors.black),
//           ),
//           Text(
//             "${demoCarts.length} items",
//             style: Theme.of(context).textTheme.caption,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: ListView.builder(
//         itemCount: demoCarts.length,
//         itemBuilder: (context, index) => Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: Dismissible(
//             key: Key(demoCarts[index].product.id.toString()),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) {
//               setState(() {
//                 demoCarts.removeAt(index);
//               });
//             },
//             background: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFE6E6),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   Spacer(),
//                   SvgPicture.asset("assets/icons/Trash.svg"),
//                 ],
//               ),
//             ),
//             child: CartCard(cart: demoCarts[index]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CartCard extends StatelessWidget {
//   const CartCard({
//     Key key,
//     @required this.cart,
//   }) : super(key: key);

//   final Cart cart;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Image.asset(cart.product.images[0]),
//             ),
//           ),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               cart.product.title,
//               style: TextStyle(color: Colors.black, fontSize: 16),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             Text.rich(
//               TextSpan(
//                 text: "\$${cart.product.price}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600, color: kPrimaryColor),
//                 children: [
//                   TextSpan(
//                       text: " x${cart.numOfItem}",
//                       style: Theme.of(context).textTheme.bodyText1),
//                 ],
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
