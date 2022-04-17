import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/constants.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/cart_provider.dart';

import 'package:project/providers/products_provider.dart';
import 'package:project/presentation/product/product_detail/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isGrid;
  final double? width;

  ProductItem({
    required this.product,
    required this.isGrid,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
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
        child: isGrid
            ? Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          child: Image(
                            image: AssetImage(
                                productsData.products[index].picturePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        productsData.products[index].category,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        productsData.products[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
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
                            formatter.format(
                                    productsData.products[index].price) +
                                ' VNĐ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
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
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RatingBar(
                            allowHalfRating: true,
                            initialRating:
                                productsData.products[index].getRating(),
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
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(${productsData.products[index].feedbacks.length})',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                width: width ?? size.width,
                height: 150,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 130,
                          height: 130,
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage(
                                  productsData.products[index].picturePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsData.products[index].category,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Container(
                                child: Text(
                                  productsData.products[index].name,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                formatter.format(
                                        productsData.products[index].price) +
                                    ' VNĐ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
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
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  RatingBar(
                                    allowHalfRating: true,
                                    initialRating: productsData.products[index]
                                        .getRating(),
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    onRatingUpdate: (double value) {},
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        CupertinoIcons.star_fill,
                                        color: Colors.amber,
                                      ),
                                      half: Icon(
                                          CupertinoIcons.star_lefthalf_fill,
                                          color: Colors.amber),
                                      empty: Icon(CupertinoIcons.star_fill,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(${productsData.products[index].feedbacks.length})',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
