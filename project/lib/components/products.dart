import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    //map-Json file
    {
      "name": "Huawei",
      "picture": "assets/products/huawei_mix.jpg",
      "old_price": 18999000,
      "price": 15000000,
    },
    {
      "name": "Iphone 12",
      "picture": "assets/products/iphone12_256.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Iphone 13",
      "picture": "assets/products/iphone13_64.png",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Samsung",
      "picture": "assets/products/samsung_blue.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Iphone 13",
      "picture": "assets/products/iphone13_128.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Samsung",
      "picture": "assets/products/samsung_gala.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Samsung",
      "picture": "assets/products/samsung_green.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Sony",
      "picture": "assets/products/sony.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Sony",
      "picture": "assets/products/sony_trang.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
    {
      "name": "Sony",
      "picture": "assets/products/sony_xanh.jpg",
      "old_price": 28999000,
      "price": 25000000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            productName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final productName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SingleProd({
    this.productName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              //here we are passing the values of the product to the product details page
              builder: (context) => new ProductDetails(
                    productDetailName: productName,
                    productDetailNewPrice: prodPrice,
                    productDetailOldPrice: prodOldPrice,
                    productDetailPicture: prodPicture,
                  ))),
          child: GridTile(
            footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    new Text(
                      "$prodOldPrice",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                )
                // child: ListTile(
                //   leading: Text(
                //     productName,
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   title: Text("$prodPrice VNĐ",
                //   style: TextStyle(
                //     color: Colors.red, fontWeight: FontWeight.w800),
                //   ),
                // subtitle: Text(
                // "$prodOldPrice VNĐ",
                // style: TextStyle(
                //   color: Colors.black54,
                //   fontWeight: FontWeight.w800,
                //   decoration: TextDecoration.lineThrough),
                // ),),
                ),
            child: Image.asset(
              prodPicture,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
