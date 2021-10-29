import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class RecentProductsGridview extends StatefulWidget {
  @override
  _RecentProductsGridviewState createState() => _RecentProductsGridviewState();
}

class _RecentProductsGridviewState extends State<RecentProductsGridview> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _){
      return GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: productsData.products.length,
          gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              index: index,
            );
          });
    });
  }
}
