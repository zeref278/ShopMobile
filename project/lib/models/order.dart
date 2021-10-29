import 'cart_item_model.dart';

class Order {
  final String id;
  final int totalPrice;
  final int status;
  final String timeOrder;
  final String paymentMethod;
  final List<CartItemModel> listItem;

  Order(
      {required this.id,
      required this.paymentMethod,
      required this.timeOrder,
      required this.totalPrice,
      required this.status,
      required this.listItem});
}
