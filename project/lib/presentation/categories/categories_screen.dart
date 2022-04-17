import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/category_model.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/presentation/cart/cart_screen.dart';
import 'package:project/presentation/search_result/search_result_screen.dart';
import 'package:project/presentation/widgets/listview_customization/products_gridview.dart';
import 'package:project/presentation/widgets/listview_customization/products_listview.dart';
import 'package:project/presentation/widgets/search_bar_customization/animated_search_bar.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';


// This is screen to show filter results by CATEGORY (from HOME SCREEN)

class CategoriesScreen extends StatefulWidget {

  //------This is category that you want filter
  final CategoryModel category;

  CategoriesScreen({
    required this.category,
  });
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  //------
  TextEditingController textController = TextEditingController();

  //------To switch Grid-List: true - grid or false - list
  bool isGridMode = true;

  //------It used for sorting price, none-ascending-descending , you can use enum here
  String isSort = 'none';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,

      appBar: AppBar(
        backgroundColor: defaultPrimaryColor,
        title: Text(
          widget.category.name,
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
            onSubmitted: (String value) {
              if (value != '' && value != '\n') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchResultScreen(
                        strValue: value,
                      )),
                );
              }
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
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //------Icon switch sort type
                    IconButton(
                      icon: (isSort == 'none' || isSort == 'descending')
                          ? Icon(
                              CupertinoIcons.sort_up,
                              size: 30,
                            )
                          : Icon(
                              CupertinoIcons.sort_down,
                              size: 30,
                            ),
                      onPressed: () {
                        setState(() {
                          if (isSort == 'none') {
                            isSort = 'ascending';
                          } else if (isSort == 'ascending') {
                            isSort = 'descending';
                          } else if (isSort == 'descending') {
                            isSort = 'ascending';
                          }
                        });
                      },
                    ),
                    //------Icon switch view mode
                    IconButton(
                      icon: Icon(
                        isGridMode
                            ? CupertinoIcons.square_split_1x2
                            : CupertinoIcons.square_grid_2x2,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isGridMode = !isGridMode;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //------ This is main of screen
                isGridMode
                    ? ProductsGridview(
                        isSort: isSort,
                        nameCategory: widget.category.name,
                      )
                    : ProductsListview(
                        isSort: isSort,
                        nameCategory: widget.category.name,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
