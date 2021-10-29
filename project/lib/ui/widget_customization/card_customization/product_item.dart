import 'package:flutter/material.dart';
import 'package:project/constants.dart';

import 'package:project/providers/products_provider.dart';
import 'package:project/ui/product/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;

  ProductItem({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(
                product: productsData.products[index],
                index: index,
              );
            },
          ),
        ),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(productsData.products[index].picturePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  productsData.products[index].name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 5,
                  children: <Widget>[
                    Text(
                      formatter.format(productsData.products[index].price) + ' VNĐ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    Text(
                      formatter.format(productsData.products[index].oldPrice) + ' VNĐ',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
