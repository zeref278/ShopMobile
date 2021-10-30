import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/product/all_products_screen.dart';
import 'package:project/ui/widget_customization/count_down_timer.dart';
import 'package:project/ui/widget_customization/listview_customization/horiontal_listview_categories.dart';
import 'package:project/ui/widget_customization/listview_customization/horizontal_listview_flash_sale.dart';
import 'package:project/ui/widget_customization/listview_customization/products_gridview.dart';
import 'package:project/ui/widget_customization/divider_customization/text_divider.dart';
import 'package:project/ui/widget_customization/listview_customization/products_listview.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridMode = true;

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
                AnimatedTextKit(
                    pause: Duration(milliseconds: 500),
                    repeatForever: true,
                    animatedTexts: [
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

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Container(height: 230, child: HorizontalListviewFlashsale()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: defaultPrimaryColor),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 60,
              child: HorizontalListviewCategories(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Products',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: defaultPrimaryColor),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AllProductsScreen();
                            },
                          ),
                        ),
                    child: Text('See all'))
              ],
            ),
          ),
          // IconButton(
          //   icon: Icon(isGridMode
          //       ? CupertinoIcons.square_split_1x2
          //       : CupertinoIcons.square_grid_2x2, size: 30,),
          //   onPressed: () {
          //     setState(() {
          //       isGridMode = !isGridMode;
          //     });
          //   },
          // ),

          //Grid view
          Container(
            child: isGridMode
                ? ProductsGridview(
                    length: 10,
                  )
                : ProductsListview(
                    length: 10,
                  ),
          )
        ],
      ),
    );
  }
}
