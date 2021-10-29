import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/flash_sale_item.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _){
      return ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: productsData.products.length,
          itemBuilder: (BuildContext context, int index) {
            return FlashSaleItem(
              product: productsData.products[index],
              width: 150,
            );
          });
    });
  }
}
