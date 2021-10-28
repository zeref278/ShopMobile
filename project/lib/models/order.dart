import 'cart_item_model.dart';

class Order {
  final String id;
  final int totalPrice;
  final int status;
  final List<CartItemModel> listItem;

  Order(
      {required this.id,
      required this.totalPrice,
      required this.status,
      required this.listItem});
}
