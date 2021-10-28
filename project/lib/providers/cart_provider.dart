import 'package:flutter/material.dart';
import 'package:project/data/list_product.dart';
import 'package:project/models/cart_item_model.dart';

class CartProvider with ChangeNotifier {
  List<CartItemModel> get cart => _cart;

  List<CartItemModel> _cart = [
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable[2],
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
    // CartItemModel(
    //   product: listProduct.first,
    //   color: listProduct.first.colorAvailable.first,
    //   storage: listProduct.first.storageAvailable.first,
    //   quantity: 1,
    // ),
  ];

  void addItem(CartItemModel newCartItem) {

    bool isExits = false;

    _cart.forEach((element) {
      if (element.product.name == newCartItem.product.name &&
          element.storage == newCartItem.storage &&
          element.color == newCartItem.color) {
        element.quantity += newCartItem.quantity;
        isExits = true;
      }
    });

    if (!isExits) _cart.add(newCartItem);

    notifyListeners();
  }
  void clearAll() {
    _cart.clear();
    notifyListeners();
  }
  void removeItem(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void changeQuantityInItem(int index, int newQuantity) {
    _cart[index].quantity = newQuantity;
    notifyListeners();
  }

  int calcTotalPrice() {
    int total = 0;
    _cart.forEach((element) {
      total += element.getCartItemPrice();
    });
    return total;
  }
}
