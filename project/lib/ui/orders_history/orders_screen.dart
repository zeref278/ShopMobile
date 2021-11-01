import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/ui/widget_customization/card_customization/order_item.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:provider/provider.dart';

//------Show order history (not detail)

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: Consumer<OrderProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: ListView.separated(
            itemCount: provider.order.length,
            itemBuilder: (context, index) {
              return OrderItem(
                order: provider.order[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
          ),
        );
      }),
    );
  }
}
