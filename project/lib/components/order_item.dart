import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/model/order.dart';
import 'package:project/pages/order_detail_page.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderDetailPage())),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  order.status == 1
                      ? Icons.pending
                      : (order.status == 2
                          ? Icons.local_shipping
                          : Icons.place),
                  size: 50,
                  color: order.status == 1
                      ? Colors.red
                      : (order.status == 2 ? Colors.blue : Colors.purple),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ORDER ID: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            order.idOrder,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "ORDER STATUS: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            order.status == 1
                                ? "Ordering"
                                : (order.status == 2
                                    ? "Delivering"
                                    : "Deliveried"),
                            style: TextStyle(
                              fontSize: 18,
                              color: order.status == 1
                                  ? Colors.red
                                  : (order.status == 2
                                      ? Colors.blue
                                      : Colors.purple),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "TOTAL PRICE: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${NumberFormat.decimalPattern().format(order.totalPrice)}\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Icon(
                    Icons.arrow_right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
