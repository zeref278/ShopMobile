import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/feedback.dart';
import 'package:project/models/product.dart';
import 'package:project/models/user.dart';

class ProductProvider with ChangeNotifier {
  List<Product> get products => _products;

  List<Product> _products = [
    Product(
        feedbacks: [
          FeedbackModel(
              user: User(
                idUser: 02,
                userName: 'Test User 1',
                email: 'linhtranttdl@gmail.com',
                address: 'Da Nang',
                gender: false,
                dateOfBirth: DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse("2019-09-30")),
                phoneNumber: '0123456789',
                avatarPath: 'assets/avatar_test1.png',
              ),
              rating: 5,
              comment:
                  'Mình mua MacBook Air M1 2020 ngày 22/9 sau đó dùng được 3 tiếng phát hiện sau loa bị rè khi bật 2 nấc cuối. Sáng ngày 23/9 mình qua chi nhánh cellphones Nguyễn Thị Thập đổi, trong quá trình đổi anh kĩ thuật và anh quản lí tên Thoại rất tận tâm kiểm tra cho mình, sau đó mình cũng đổi một máy mới. Cuối cùng mình phát hiện ra con MacBook sau cũng có dấu hiệu rè (nhưng ở mức chấp nhận được). Rất hài lòng về chất lượng dịch vụ, sẽ tiếp tục mua của cửa hàng.',
              time: '30/10/2021 17:17:17'),
          FeedbackModel(
              user: User(
                idUser: 03,
                userName: 'Test User 111111111111111',
                email: 'linhtranttdl@gmail.com',
                address: 'Da Nang',
                gender: false,
                dateOfBirth: DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse("2019-09-30")),
                phoneNumber: '0123456789',
                avatarPath: 'assets/avatar_test2.png',
              ),
              rating: 4,
              comment:
                  'vừa mua chưa được 1 tuần thì thấy sale còn 24tr6, tức thật',
              time: '29/10/2021 10:10:10'),
        ],
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
        feedbacks: [],
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
        feedbacks: [],
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
        feedbacks: [],
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
        feedbacks: [],
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
        feedbacks: [],
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

  void addFeedbackIntoProductAt(int index, FeedbackModel newFeedback) {
    _products[index].feedbacks.insert(0, newFeedback);

    notifyListeners();
  }
}
