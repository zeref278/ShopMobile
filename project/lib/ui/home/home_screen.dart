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

    Size size = MediaQuery.of(context).size;
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: ListView(
        children: <Widget>[
          //assets carousel begins here
          assetsCarousel,

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  ColorizeAnimatedText('Flash Sale',
                      textStyle: TextStyle(
                          fontFamily: 'Catamaran',
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                      colors: colorizeColors),
                ]),
                CountDownTimer(
                  timeStart: '2021-11-20 20:00:00',
                ),
              ],
            ),
          ),

          //horizontal list view begins here
          Container(
              height: 200,
              decoration: BoxDecoration(),
              child: HorizontalList()),
          //HorizontalList(),
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

