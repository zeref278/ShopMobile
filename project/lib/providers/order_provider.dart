import 'package:flutter/material.dart';
import 'package:project/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> get order => _order;

  List<Order> _order = [
    Order(idOrder: 'order7', totalPrice: 200000, status: 1),
    Order(idOrder: 'order6', totalPrice: 400000, status: 2),
    Order(idOrder: 'order5', totalPrice: 600000, status: 3),
    Order(idOrder: 'order4', totalPrice: 240000, status: 3),
    Order(idOrder: 'order3', totalPrice: 150000, status: 3),
    Order(idOrder: 'order2', totalPrice: 700000, status: 3),
    Order(idOrder: 'order1', totalPrice: 1000000, status: 3),
  ];
}
