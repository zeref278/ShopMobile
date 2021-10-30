import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGridview extends StatefulWidget {
  final int? length;
  final String? nameCategory;

  ProductsGridview({this.length, this.nameCategory});

  @override
  _ProductsGridviewState createState() => _ProductsGridviewState();
}

class _ProductsGridviewState extends State<ProductsGridview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      return widget.nameCategory == null
          ? GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.length ?? productsData.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  isGrid: true,
                  index: index,
                );
              })
          : GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: productsData
                  .filterProductByCategory(widget.nameCategory!)
                  .length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                    index: productsData.getIndexByProduct(productsData
                        .filterProductByCategory(widget.nameCategory!)[index]),
                    isGrid: true);
              });
    });
  }
}
