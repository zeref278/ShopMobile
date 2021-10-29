import 'package:flutter/material.dart';
import 'package:project/models/product.dart';

import '../../../constants.dart';


class FlashSaleItem extends StatelessWidget {
  final double width;
  final Product product;

  const FlashSaleItem({
    Key? key,
    required this.width,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
      },
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
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(product.picturePath),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      formatter.format(product.price) + ' VNĐ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      formatter.format(product.oldPrice) + ' VNĐ',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}