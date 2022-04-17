import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/presentation/widgets/card_customization/product_item.dart';
import 'package:provider/provider.dart';

class ProductsListview extends StatefulWidget {
  final int? length;
  final String? nameCategory;
  final String? nameProduct;
  final String isSort;

  ProductsListview(
      {this.length, this.nameCategory, this.nameProduct, required this.isSort});

  @override
  _ProductsListviewState createState() => _ProductsListviewState();
}

class _ProductsListviewState extends State<ProductsListview> {
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

            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listTemp.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: listTemp[index], isGrid: false);
                });
          } else {
            //search result
            List<Product> listTemp = [];

            if (widget.isSort == 'none') {
              listTemp = productsData.filterProductByName(widget.nameProduct!);
            } else {
              int isSortAscending = widget.isSort == 'ascending' ? 1 : 0;
              listTemp = productsData.filterProductByName(widget.nameProduct!);
              listTemp.sort((firstElement, secondElement) =>
                  (firstElement.price > secondElement.price)
                      ? isSortAscending
                      : 1 - isSortAscending);
            }
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listTemp.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: listTemp[index], isGrid: false);
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

          return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listTemp.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(product: listTemp[index], isGrid: false);
              });
        }
      } else {
        // feature product
        return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: (widget.length! <= productsData.products.length)
                ? widget.length
                : productsData.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                isGrid: false,
                product: productsData.products[index],
              );
            });
      }
    });
  }
}
