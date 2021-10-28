import 'package:project/models/product.dart';

class CartItemModel {
  Product product;
  int quantity;

  String color;
  String storage;

  CartItemModel({
    required this.product,
    required this.quantity,

    required this.color,
    required this.storage
});

  int getCartItemPrice() {
    return product.calcPrice(storage, color) * quantity;
  }


}