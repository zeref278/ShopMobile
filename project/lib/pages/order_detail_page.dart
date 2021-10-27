import 'package:flutter/material.dart';
import 'package:project/components/order_detail_item.dart';

class OrderDetailPage extends StatelessWidget {
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
      body: Container(
        margin: EdgeInsets.only(bottom: 90),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return OrderItem();
          },
        ),
      ),
      bottomSheet: checkoutSection(context, 1000000),
    );
  }

  Widget checkoutSection(BuildContext context, double subTotal) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 15),
        child: Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$ ${subTotal.toStringAsFixed(3)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
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
