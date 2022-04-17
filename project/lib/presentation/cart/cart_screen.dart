// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:project/providers/cart_provider.dart';
// import 'package:project/providers/orders_provider.dart';
// import 'package:project/presentation/widgets/card_customization/cart_items.dart';
// import 'package:project/presentation/checkout/checkout_screen.dart';
// import 'package:provider/provider.dart';
//
//
// import '../../constants.dart';
//
// //This is screen show cart item, CART ITEM is so important
//
// class CartScreen extends StatefulWidget {
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: defaultBackgroundColor,
//
//       //------AppBar
//       appBar: AppBar(
//         elevation: 0.1,
//         backgroundColor: defaultPrimaryColor,
//         title: Text('Your cart'),
//         actions: [
//           Consumer<CartProvider>(
//             builder: (context, cartData, _) {
//               return IconButton(
//                 disabledColor: defaultPrimaryColor,
//                 color: Colors.red[700],
//                 icon: Icon(
//                   CupertinoIcons.clear_fill,
//                 ),
//                 onPressed: cartData.cart.length == 0 ? null :() => showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text("Clear cart"),
//                         content: Text("Do you want clear all item ?"),
//                         actions: [
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 cartData.clearAll();
//                               },
//                               child: Text(
//                                 "Confirm",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.red),
//                               )),
//                           TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: Text(
//                                 "Cancel",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )),
//                         ],
//                       );
//                     }),
//               );
//             },
//           ),
//           SizedBox(width: 5)
//         ],
//       ),
//       body: Consumer<CartProvider>(
//         builder: (context, cartData, _) {
//           return cartData.cart.length == 0
//               ? Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(CupertinoIcons.bag_badge_minus,
//                           color: Colors.red, size: 40),
//                       SizedBox(width: 10),
//                       Text(
//                         'Your cart is empty !',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.red,
//                             fontSize: 20),
//                       )
//                     ],
//                   ),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Flexible(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: cartData.cart.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return CartItem(
//                                   index: index,
//                                   onPressedDelete: () {
//                                     cartData.removeItem(index);
//                                   });
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(left: 10, right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               'Total Price: ',
//                               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                             ),
//                             Text(
//                               '${formatter.format(cartData.calcTotalPrice())} VNĐ',
//                               style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.deepOrange),
//                             ),
//                             Consumer<OrderProvider>(
//                                 builder: (context, orderData, _) {
//                               return MaterialButton(
//
//                                 onPressed: () => Navigator.of(context)
//                                     .push(MaterialPageRoute(builder: (context) => CheckoutScreen())),
//                                 color: Colors.red,
//                                 textColor: Colors.white,
//                                 elevation: 10,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Text("Buy Now",style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16)),
//                               );
//                             })
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//         },
//       ),
//     );
//   }
// }
