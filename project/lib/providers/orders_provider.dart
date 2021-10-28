import 'package:flutter/material.dart';
import 'package:project/data/list_product.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> get order => _order;

  List<Order> _order = [
    Order(
      id: 'order6',
      totalPrice: 50500000,
      status: 2,
      listItem: [
        CartItemModel(
          product: listProduct[3],
          color: listProduct.first.colorAvailable[2],
          storage: listProduct.first.storageAvailable.first,
          quantity: 1,
        ),
        CartItemModel(
          product: listProduct[2],
          color: listProduct.first.colorAvailable.first,
          storage: listProduct.first.storageAvailable.first,
          quantity: 1,
        ),
      ],
    ),
    Order(
      id: 'order5',
      totalPrice: 40500000,
      status: 3,
      listItem: [
        CartItemModel(
          product: listProduct[0],
          color: listProduct.first.colorAvailable[2],
          storage: listProduct.first.storageAvailable.first,
          quantity: 1,
        ),
        CartItemModel(
          product: listProduct[1],
          color: listProduct.first.colorAvailable.first,
          storage: listProduct.first.storageAvailable.first,
          quantity: 1,
        ),
      ],
    ),
  ];

  void addOrder(Order newOrder){
    _order.insert(0, newOrder);
    notifyListeners();
  }
}
