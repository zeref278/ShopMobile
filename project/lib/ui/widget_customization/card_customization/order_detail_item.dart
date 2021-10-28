import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/models/cart_item_model.dart';

class OrderDetailItem extends StatelessWidget {
  final CartItemModel itemModel;

  OrderDetailItem({
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(
                          itemModel.product.picturePath)
                          .image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemModel.product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(itemModel.color +
                          ', ${itemModel.storage}')
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text('${itemModel.quantity}'),
                    Text(' x '),
                    Text(
                        '${formatter.format(itemModel.product.calcPrice(itemModel.storage, itemModel.color))} VNĐ'),
                    SizedBox(height: 10),
                    Text(
                        '= ${formatter.format(itemModel.quantity * itemModel.product.calcPrice(itemModel.storage, itemModel.color))} VNĐ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: 16))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
