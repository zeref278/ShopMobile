import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> get products => _products;

  List<Product> _products = [
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

  int filterFavoriteProduct() {
    int count = 0;
    _products.forEach((product) {
      if (product.isFavorite) {
        count++;
      }
    });

    return count;
  }

  void changeFavoriteAt(int index) {
    _products[index].isFavorite = !_products[index].isFavorite;
    notifyListeners();
  }
}
