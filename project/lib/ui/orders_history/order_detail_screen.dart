import 'package:flutter/material.dart';
import 'package:project/models/order.dart';
import 'package:project/ui/widget_customization/card_customization/cart_items.dart';

import '../../constants.dart';
import '../widget_customization/card_customization/order_detail_item.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  OrderDetailScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              child: Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: order.listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderDetailItem(
                      itemModel: order.listItem[index],);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'TOTAL PRICE: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Text(
                    '${formatter.format(order.totalPrice)} VNĐ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
