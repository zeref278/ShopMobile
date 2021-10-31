import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/product/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class FlashSaleItem extends StatelessWidget {
  final double width;
  final Product product;

  const FlashSaleItem({Key? key, required this.width, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productsData, _) {
        int index = productsData.getIndexByProduct(product);
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
          child: Container(
            width: 150,
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(
                            productsData.products[index].picturePath),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          productsData.products[index].category,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600,),
                        ),
                        Text(
                          productsData.products[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          formatter.format(productsData.products[index].price) +
                              ' VNĐ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          formatter.format(
                                  productsData.products[index].oldPrice) +
                              ' VNĐ',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RatingBar(
                        allowHalfRating: true,
                        initialRating: productsData.products[index].getRating(),
                        itemSize: 15,
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                        ratingWidget: RatingWidget(
                          full: Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          half: Icon(CupertinoIcons.star_lefthalf_fill,
                              color: Colors.amber),
                          empty: Icon(CupertinoIcons.star_fill,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '(${productsData.products[index].feedbacks.length})',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
