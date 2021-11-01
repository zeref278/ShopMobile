import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/cart/cart_screen.dart';
import 'package:project/ui/widget_customization/listview_customization/products_gridview.dart';
import 'package:project/ui/widget_customization/listview_customization/products_listview.dart';
import 'package:project/ui/widget_customization/search_bar_customization/animated_search_bar.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

//------Like name

class SearchResultScreen extends StatefulWidget {
  final String strValue;

  SearchResultScreen({required this.strValue});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController textController = TextEditingController();
  bool isGridMode = true;
  String isSort = 'none';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
      builder: (context, productsData, _) {
        return Scaffold(
          backgroundColor: defaultBackgroundColor,
          appBar: AppBar(
            backgroundColor: defaultPrimaryColor,
            title: Text(
              'Search Result',
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
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text('Found ', style: TextStyle(fontSize: 16)),
                    Text(
                      '${productsData.filterProductByName(widget.strValue).length} ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text('results for keyword ',
                        style: TextStyle(fontSize: 16)),
                    Text(
                      "'${widget.strValue}'",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                isGridMode
                    ? ProductsGridview(
                        nameProduct: widget.strValue,
                        isSort: isSort,
                      )
                    : ProductsListview(
                        nameProduct: widget.strValue,
                        isSort: isSort,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
