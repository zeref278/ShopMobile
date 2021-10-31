import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/feedback.dart';
import 'package:project/models/product.dart';
import 'package:project/models/user.dart';

class ProductProvider with ChangeNotifier {
  List<Product> get products => _products;

  List<Product> _products = [
    Product(
        productID: 'SP01',
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
        name: 'iPhone 12',
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
        name: 'iPhone 11',
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
        name: 'ROG Phone 5',
        price: 20000000,
        oldPrice: 24999000,
        category: 'ASUS',
        picturePath: 'assets/products/asus_rog_phone_5.jpg',
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
        name: 'iPhone 11 Pro Max',
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
        productID: 'SP06',
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
        productID: 'SP07',
        feedbacks: [],
        isFavorite: false,
        name: 'iPhone 13',
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
        productID: 'SP08',
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
        name: 'iPhone 13 Mini',
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
        productID: 'SP09',
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
        productID: 'SP10',
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
        productID: 'SP11',
        feedbacks: [],
        isFavorite: false,
        name: 'Nord N10 5G',
        price: 17000000,
        oldPrice: 18999000,
        category: 'OnePlus',
        picturePath: 'assets/products/oneplus_nord_n10_5g.jpg',
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
        name: '7 Pro',
        price: 17000000,
        oldPrice: 18999000,
        category: 'Realme',
        picturePath: 'assets/products/realme_7_pro.jpg',
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
        productID: 'SP14',
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
        productID: 'SP15',
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
        productID: 'SP16',
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
        productID: 'SP17',
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
        productID: 'SP18',
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
        productID: 'SP19',
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
        productID: 'SP20',
        feedbacks: [],
        isFavorite: false,
        name: 'ROG Phone 3',
        price: 9000000,
        oldPrice: 11999000,
        category: 'ASUS',
        picturePath: 'assets/products/asus_rog_3.jpg',
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
        productID: 'SP21',
        feedbacks: [],
        isFavorite: false,
        name: 'iPhone XR',
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

  int filterFavoriteProduct() {
    int count = 0;
    _products.forEach((product) {
      if (product.isFavorite) {
        count++;
      }
    });

    return count;
  }

  List<Product> filterProductByName(String name) {
    List<Product> result = [];
    _products.forEach((element) {
      if (element.name.toUpperCase().startsWith(name.toUpperCase()) ||
          element.category.toUpperCase().startsWith(name.toUpperCase())) {
        result.add(element);
      }
    });
    return result;
  }

  List<Product> filterProductByCategory(String category) {
    List<Product> result = [];
    _products.forEach((element) {
      if (element.category == category) {
        result.add(element);
      }
    });
    return result;
  }

  List<Product> filterProductByParityPrice(Product product, int epsilon) {
    List<Product> result = [];
    _products.forEach((element) {
      if ((element.price - product.price).abs() <= epsilon &&
          element.productID != product.productID) {
        result.add(element);
      }
    });
    return result;
  }

  List<Product> sortAllProducts(bool isSortAscending) {
    List<Product> result = List.from(_products);

    if (isSortAscending) {
      result.sort((firstElement, secondElement) =>
          (firstElement.price > secondElement.price) ? 1 : 0);
    } else {
      result.sort((firstElement, secondElement) =>
          (firstElement.price > secondElement.price) ? 0 : 1);
    }

    return result;
  }

  int getIndexByProduct(Product id) {
    return _products.indexWhere((element) => element.productID == id.productID);
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
