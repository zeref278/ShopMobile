import 'package:flutter/material.dart';
import 'package:project/components/order_item.dart';
import 'package:project/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("My order"),
      ),
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
