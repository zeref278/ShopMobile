import 'package:flutter/material.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class ProductsListview extends StatefulWidget {
  final int? length;
  final String? nameCategory;

  ProductsListview({this.length, this.nameCategory});

  @override
  _ProductsListviewState createState() => _ProductsListviewState();
}

class _ProductsListviewState extends State<ProductsListview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      return widget.nameCategory == null
          ? ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.length ?? productsData.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  isGrid: false,
                  index: index,
                );
              })
          : ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: productsData
                  .filterProductByCategory(widget.nameCategory!)
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                    index: productsData.getIndexByProduct(productsData
                        .filterProductByCategory(widget.nameCategory!)[index]),
                    isGrid: false);
              });
    });
  }
}
