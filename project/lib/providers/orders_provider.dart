import 'package:flutter/material.dart';

import 'package:project/models/cart_item_model.dart';
import 'package:project/models/order.dart';
import 'package:intl/intl.dart';
import 'package:project/models/product.dart';

class OrderProvider with ChangeNotifier {
  List<Order> get order => _order;

  List<Order> _order = [
    Order(
      timeOrder: DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now()),
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
      paymentMethod: 'COD',
    ),
    Order(
      timeOrder: DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now()),
      paymentMethod: 'COD',
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

  void addOrder(Order newOrder) {
    _order.insert(0, newOrder);
    notifyListeners();
  }
}

//Only use for sample order history
List listProduct = [
  Product(
      isFavorite: false,
      name: 'Huawei Mix',
      price: 15000000,
      oldPrice: 18999000,
      category: 'Huawei',
      picturePath: 'assets/products/huawei_mix.jpg',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
  Product(
      isFavorite: false,
      name: 'Iphone 12',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Iphone',
      picturePath: 'assets/products/iphone12_256.jpg',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
  Product(
      isFavorite: false,
      name: 'Iphone 11',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Iphone',
      picturePath: 'assets/products/iphone13_64.png',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
  Product(
      isFavorite: false,
      name: 'Samsung',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Samsung',
      picturePath: 'assets/products/samsung_blue.jpg',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
  Product(
      isFavorite: false,
      name: 'Iphone 13',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Iphone',
      picturePath: 'assets/products/iphone13_128.jpg',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
  Product(
      isFavorite: false,
      name: 'Samsung Galaxy ...',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Samsung',
      picturePath: 'assets/products/samsung_gala.jpg',
      storageAvailable: ['64GB', '128GB', '512GB'],
      colorAvailable: ['Red', 'Green', 'Blue'],
      quantityRemaining: 100,
      shortDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat',
      bonusMap: {
        '64GB': '0',
        '128GB': '1000000',
        '512GB': '4000000',
        'Red': '0',
        'Green': '500000',
        'Blue': '500000',
      }),
];
