import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/presentation/widgets/card_customization/flash_sale_item.dart';
import 'package:provider/provider.dart';

class HorizontalListviewFlashsale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsData.products.length,
          itemBuilder: (BuildContext context, int index) {
            return FlashSaleItem(
              width: 150,
              product: productsData.products[index],
            );
          });
    });
  }
}
