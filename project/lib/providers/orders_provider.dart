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
      totalPrice: 43500000,
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
      totalPrice: 32500000,
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
      productID: 'SP01',
      feedbacks: [
      ],
      isFavorite: false,
      name: 'Mix',
      price: 10000000,
      oldPrice: 12999000,
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
      productID: 'SP02',
      feedbacks: [],
      isFavorite: false,
      name: 'Iphone 12',
      price: 22000000,
      oldPrice: 28999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_12.jpg',
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
      productID: 'SP03',
      feedbacks: [],
      isFavorite: false,
      name: 'Iphone 11',
      price: 20000000,
      oldPrice: 24999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_11.jpg',
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
      productID: 'SP04',
      feedbacks: [],
      isFavorite: false,
      name: 'Iphone 11 Pro Max',
      price: 23000000,
      oldPrice: 24999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_11_pro_max.jpg',
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
      productID: 'SP05',
      feedbacks: [],
      isFavorite: false,
      name: 'Redmi Note 10',
      price: 11000000,
      oldPrice: 13999000,
      category: 'Xiaomi',
      picturePath: 'assets/products/xiaomi_redmi_note_10.jpg',
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
      productID: 'SP06',
      feedbacks: [],
      isFavorite: false,
      name: 'Iphone 13',
      price: 25000000,
      oldPrice: 28999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_13.jpg',
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
      productID: 'SP07',
      feedbacks: [
      ],
      isFavorite: false,
      name: 'Iphone 13 Mini',
      price: 23000000,
      oldPrice: 25999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_13_mini.jpg',
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
      productID: 'SP08',
      feedbacks: [],
      isFavorite: false,
      name: 'Leica',
      price: 15000000,
      oldPrice: 16999000,
      category: 'Huawei',
      picturePath: 'assets/products/huawei_leica.jpg',
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
      productID: 'SP09',
      feedbacks: [],
      isFavorite: false,
      name: 'Reno5',
      price: 15000000,
      oldPrice: 15999000,
      category: 'Oppo',
      picturePath: 'assets/products/oppo_reno5.jpg',
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
      productID: 'SP10',
      feedbacks: [],
      isFavorite: false,
      name: 'Reno6 5G',
      price: 17000000,
      oldPrice: 18999000,
      category: 'Oppo',
      picturePath: 'assets/products/oppo_reno6_5g.jpg',
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
      productID: 'SP11',
      feedbacks: [],
      isFavorite: false,
      name: 'A15s',
      price: 7000000,
      oldPrice: 8999000,
      category: 'Oppo',
      picturePath: 'assets/products/oppo_a15s.jpg',
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
      productID: 'SP12',
      feedbacks: [],
      isFavorite: false,
      name: 'Galaxy A32',
      price: 8000000,
      oldPrice: 9999000,
      category: 'Samsung',
      picturePath: 'assets/products/samsung_galaxy_a32.jpg',
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
      productID: 'SP13',
      feedbacks: [],
      isFavorite: false,
      name: 'Galaxy Note 10',
      price: 14000000,
      oldPrice: 19999000,
      category: 'Samsung',
      picturePath: 'assets/products/samsung_note_10.jpg',
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
      productID: 'SP14',
      feedbacks: [],
      isFavorite: false,
      name: '11T Pro',
      price: 15000000,
      oldPrice: 18999000,
      category: 'Xiaomi',
      picturePath: 'assets/products/xiaomi_11t_pro.jpg',
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
      productID: 'SP15',
      feedbacks: [],
      isFavorite: false,
      name: 'Mi 11',
      price: 12000000,
      oldPrice: 15999000,
      category: 'Xiaomi',
      picturePath: 'assets/products/xiaomi_mi_11.jpg',
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
      productID: 'SP16',
      feedbacks: [],
      isFavorite: false,
      name: 'Redmi 9',
      price: 9000000,
      oldPrice: 11999000,
      category: 'Xiaomi',
      picturePath: 'assets/products/xiaomi_redmi_9.jpg',
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
      productID: 'SP17',
      feedbacks: [],
      isFavorite: false,
      name: 'Iphone XR',
      price: 20000000,
      oldPrice: 26999000,
      category: 'Apple',
      picturePath: 'assets/products/iphone_xr.jpg',
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
