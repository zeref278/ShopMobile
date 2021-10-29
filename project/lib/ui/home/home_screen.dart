import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/widget_customization/listview_customization/horizontal_listview.dart';
import 'package:project/ui/widget_customization/listview_customization/recent_products_gridview.dart';
import 'package:project/ui/widget_customization/divider_customization/text_divider.dart';


import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Widget assetsCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.asset('assets/carousel/img1.jpg'),
          Image.asset('assets/carousel/img2.jpg'),
          Image.asset('assets/carousel/img3.jpg'),
          Image.asset('assets/carousel/img4.jpg'),
          Image.asset('assets/carousel/img5.png'),
          Image.asset('assets/carousel/img6.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 0,
        // animationCurve: Curves.linear,
        // animationDuration: Duration(microseconds: 3000),
      ),
    );

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: ListView(
        children: <Widget>[
          //assets carousel begins here
          assetsCarousel,

          TextDivider(
            child: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),

          //horizontal list view begins here
          HorizontalList(),

          TextDivider(
            child: Text(
              'Recent Product',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),

          //Grid view
          Container(
            //height: ,
            child: RecentProductsGridview(),
          )
        ],
      ),
    );
  }

}

