import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/constants.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final void Function() onPressedDelete;

  final int index;

  CartItem({
    required this.onPressedDelete,
    required this.index,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartData, _) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: widget.onPressedDelete,
          ),
        ],
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(cartData
                                  .cart[widget.index].product.picturePath)
                              .image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartData.cart[widget.index].product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cartData.cart[widget.index].color +
                              ', ${cartData.cart[widget.index].storage}')
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              disabledColor: Colors.white,
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                              onPressed: cartData.cart[widget.index].quantity ==
                                      1
                                  ? null
                                  : () {
                                      cartData.changeQuantityInItem(
                                          widget.index,
                                          cartData.cart[widget.index].quantity -
                                              1);
                                    },
                            ),
                            Text(
                              '${cartData.cart[widget.index].quantity}',
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              disabledColor: Colors.white,
                              icon: Icon(
                                Icons.add,
                                size: 20,
                              ),
                              onPressed: cartData.cart[widget.index].quantity ==
                                      cartData.cart[widget.index].product
                                          .quantityRemaining
                                  ? null
                                  : () {
                                      setState(() {
                                        cartData.changeQuantityInItem(
                                            widget.index,
                                            cartData.cart[widget.index]
                                                    .quantity +
                                                1);
                                      });
                                    },
                            ),
                          ],
                        ),
                        Text(' x '),
                        Text(
                            '${formatter.format(cartData.cart[widget.index].product.calcPrice(cartData.cart[widget.index].storage, cartData.cart[widget.index].color))} VNĐ'),
                        SizedBox(height: 10),
                        Text(
                            '= ${formatter.format(cartData.cart[widget.index].quantity * cartData.cart[widget.index].product.calcPrice(cartData.cart[widget.index].storage, cartData.cart[widget.index].color))} VNĐ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                                fontSize: 16))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
