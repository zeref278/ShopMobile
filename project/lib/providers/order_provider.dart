import 'package:flutter/material.dart';
import 'package:project/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> get order => _order;

  List<Order> _order = [
    Order(id: 'order7', totalPrice: 200000000, status: 1),
    Order(id: 'order6', totalPrice: 400000, status: 2),
    Order(id: 'order5', totalPrice: 600000, status: 3),
    Order(id: 'order4', totalPrice: 240000, status: 3),
    Order(id: 'order3', totalPrice: 150000, status: 3),
    Order(id: 'order2', totalPrice: 700000, status: 3),
    Order(id: 'order1', totalPrice: 1000000, status: 3),
  ];
}
