import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/flash_sale_item.dart';
import 'package:provider/provider.dart';

class HorizontalListviewParityProduct extends StatelessWidget {

  final Product product;

  HorizontalListviewParityProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      List<Product> listTemp = productsData.filterProductByParityPrice(product, 2000000);
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listTemp.length,
          itemBuilder: (BuildContext context, int index) {
            return FlashSaleItem(
              width: 150,
              product: listTemp[index],
            );
          });
    });
  }

}