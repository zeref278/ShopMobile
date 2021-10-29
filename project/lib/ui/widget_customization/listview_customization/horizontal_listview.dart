import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/cats/iphone.jpg',
            imageCaption: 'Iphone',
          ),
          Category(
            imageLocation: 'assets/cats/samsung.jpg',
            imageCaption: 'Samsung',
          ),
          Category(
            imageLocation: 'assets/cats/LG.jpg',
            imageCaption: 'LG',
          ),
          Category(
            imageLocation: 'assets/cats/sony.jpg',
            imageCaption: 'Sony',
          ),
          Category(
            imageLocation: 'assets/cats/huawei.jpg',
            imageCaption: 'Huawei',
          ),
          Category(
            imageLocation: 'assets/cats/oppo.jpg',
            imageCaption: 'Oppo',
          ),
          Category(
            imageLocation: 'assets/cats/redmi.jpg',
            imageCaption: 'Redmi',
          ),
          Category(
            imageLocation: 'assets/cats/vivo.jpg',
            imageCaption: 'Vivo',
          ),
          Category(
            imageLocation: 'assets/cats/khac.jpg',
            imageCaption: 'Khác',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({required this.imageLocation, required this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
            width: 100.0,
            child: ListTile(
                title: Image.asset(
                  imageLocation,
                  width: 100,
                  height: 100,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    imageCaption,
                    style: new TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ))),
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('image_location', image_location));
  // }
}
