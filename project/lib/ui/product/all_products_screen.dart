import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/cart/cart_screen.dart';
import 'package:project/ui/widget_customization/listview_customization/products_gridview.dart';
import 'package:project/ui/widget_customization/listview_customization/products_listview.dart';
import 'package:project/ui/widget_customization/search_bar_customization/animated_search_bar.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  TextEditingController textController = TextEditingController();
  bool isGridMode = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        backgroundColor: defaultPrimaryColor,
        title: Text(
          'All products',
        ),
        actions: [
          AnimatedSearchBar(
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              CupertinoIcons.xmark,
              color: Colors.black,
            ),
            width: size.width - 65,
            textController: textController,
            rtl: true,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
                icon: Consumer<CartProvider>(
                  builder: (context, cartData, _) {
                    return Badge(
                      elevation: 0,
                      badgeColor: cartData.cart.length == 0
                          ? Colors.transparent
                          : Colors.red,
                      badgeContent: Text(cartData.cart.length == 0
                          ? ''
                          : '${cartData.cart.length}'),
                      child: Icon(
                        CupertinoIcons.cart,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen()))),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productsData, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(10 ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.line_horizontal_3_decrease, size: 30,),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(isGridMode
                          ? CupertinoIcons.square_split_1x2
                          : CupertinoIcons.square_grid_2x2, size: 30,),
                      onPressed: () {
                        setState(() {
                          isGridMode = !isGridMode;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                isGridMode? ProductsGridview(): ProductsListview(),
              ],
            ),
          );
        },
      ),
    );
  }
}
