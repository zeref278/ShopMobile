import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/data/list_product.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: listProduct.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: listProduct[index],
          );
        });
  }
}
