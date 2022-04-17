import 'package:flutter/material.dart';
import 'package:project/models/order.dart';

import '../../constants.dart';
import '../widgets/card_customization/order_detail_item.dart';

//------Show list product in order history

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  OrderDetailScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Order Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: defaultPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: order.listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderDetailItem(
                      itemModel: order.listItem[index],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Time Order: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Text(
                  order.timeOrder,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Payment Method: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Text(
                  order.paymentMethod,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal),
                )
              ],
            ),
            SizedBox(height: 20,),
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
