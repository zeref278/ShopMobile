import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/models/product.dart';
import 'package:project/ui/product/product_detail_screen.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ProductDetailScreen(
              product: product,
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
                    image: AssetImage(product.picturePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                product.name,
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
                    formatter.format(product.price) + ' VNĐ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  Text(
                    formatter.format(product.oldPrice)+' VNĐ',
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
  }
}
