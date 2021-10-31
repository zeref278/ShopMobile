import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGridview extends StatefulWidget {
  final int? length;
  final String? nameCategory;
  final String? nameProduct;
  final String isSort;

  ProductsGridview({
    this.length,
    this.nameCategory,
    this.nameProduct,
    required this.isSort,
  });

  @override
  _ProductsGridviewState createState() => _ProductsGridviewState();
}

class _ProductsGridviewState extends State<ProductsGridview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      if (widget.length == null) {
        //all products - category - search result
        if (widget.nameCategory == null) {
          //all products - search result

          if (widget.nameProduct == null) {
            //all products
            List<Product> listTemp = [];

            if (widget.isSort == 'none') {
              listTemp = productsData.products;
            } else {
              bool isSortAscending =
                  widget.isSort == 'ascending' ? true : false;
              listTemp = productsData.sortAllProducts(isSortAscending);
            }

            return GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listTemp.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: listTemp[index], isGrid: true);
                });
          } else {
            //Search Result
            List<Product> listTemp = [];

            if (widget.isSort == 'none') {
              listTemp = productsData.filterProductByName(widget.nameProduct!);
            } else {
              int isSortAscending = widget.isSort == 'ascending' ? 1 : 0;
              listTemp =
                  productsData.filterProductByName(widget.nameProduct!);
              listTemp.sort((firstElement, secondElement) =>
              (firstElement.price > secondElement.price)
                  ? isSortAscending
                  : 1 - isSortAscending);
            }

            return GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listTemp.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: listTemp[index], isGrid: true);
                });
          }
        } else {
          //category
          List<Product> listTemp = [];

          if (widget.isSort == 'none') {
            listTemp =
                productsData.filterProductByCategory(widget.nameCategory!);
          } else {
            int isSortAscending = widget.isSort == 'ascending' ? 1 : 0;
            listTemp =
                productsData.filterProductByCategory(widget.nameCategory!);
            listTemp.sort((firstElement, secondElement) =>
                (firstElement.price > secondElement.price)
                    ? isSortAscending
                    : 1 - isSortAscending);
          }

          return GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listTemp.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(product: listTemp[index], isGrid: true);
              });
        }
      } else {
        // feature product
        return GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: (widget.length! <= productsData.products.length)
                ? widget.length
                : productsData.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                isGrid: true,
                product: productsData.products[index],
              );
            });
      }
    });
  }
}
