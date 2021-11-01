import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/feedback.dart';
import 'package:project/models/product.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/cart/cart_screen.dart';
import 'package:project/ui/checkout/checkout_one_item.dart';
import 'package:project/ui/search_result/search_result_screen.dart';
import 'package:project/ui/widget_customization/card_customization/feedback_item.dart';
import 'package:project/ui/widget_customization/divider_customization/text_divider.dart';
import 'package:project/ui/widget_customization/listview_customization/horizontal_listview_parity_product.dart';
import 'package:project/ui/widget_customization/search_bar_customization/animated_search_bar.dart';
import 'package:project/ui/widget_customization/text_field_customization/text_field_customization.dart';
import 'package:provider/provider.dart';


//------ Most important screen
class ProductDetailScreen extends StatefulWidget {

  //------Index of product in PRODUCT PROVIDER
  final int index;

  //------Product to show
  final Product product;

  ProductDetailScreen({required this.product, required this.index});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  //------Store your choice
  String? _storage;
  String? _color;
  int _quantity = 1;

  TextEditingController commentController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  //------Number of stars
  double rating = 1;

  @override
  void initState() {

    //init value to STORAGE and COLOR
    _storage = widget.product.storageAvailable.first;
    _color = widget.product.colorAvailable.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(builder: (context, productsData, _) {
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
              textController: searchController,
              rtl: true,
              onSuffixTap: () {
                setState(() {
                  searchController.clear();
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Image of product
                Container(
                  height: 300,
                  child: GridTile(
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(widget.product.picturePath),
                        )),
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                          leading: new Text(widget.product.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    "${formatter.format(widget.product.calcOldPrice(_storage!, _color!))} VNĐ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              ),
                              Expanded(
                                  child: Text(
                                "${formatter.format(widget.product.calcPrice(_storage!, _color!))} VNĐ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )),
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //------Select STORAGE, COLOR, QUANTITY
                Text(
                  'Select Option',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2, color: defaultPrimaryColor)),
                  width: 250,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Storage'),
                          DropdownButton(
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              size: 18,
                            ),
                            value: _storage,
                            onChanged: (String? newValue) {
                              setState(() {
                                _storage = newValue;
                              });
                            },
                            items:
                                widget.product.storageAvailable.map((location) {
                              return DropdownMenuItem(
                                child: Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Color'),
                          DropdownButton(
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              size: 18,
                            ),
                            value: _color,
                            onChanged: (String? newValue) {
                              setState(() {
                                _color = newValue;
                              });
                            },
                            items:
                                widget.product.colorAvailable.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Quantity'),
                          Row(
                            children: [
                              IconButton(
                                disabledColor: Colors.white,
                                icon: Icon(CupertinoIcons.minus_square),
                                onPressed: _quantity == 1
                                    ? null
                                    : () {
                                        setState(() {
                                          _quantity--;
                                        });
                                      },
                              ),
                              Text(
                                '$_quantity',
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                disabledColor: Colors.white,
                                icon: Icon(CupertinoIcons.plus_square),
                                onPressed: _quantity ==
                                        widget.product.quantityRemaining
                                    ? null
                                    : () {
                                        setState(() {
                                          _quantity++;
                                        });
                                      },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                //=========The second button=============

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      //------Button BUY NOW
                      Expanded(
                          child: MaterialButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckoutOneItemScreen(
                                      itemModel: CartItemModel(
                                          storage: _storage!,
                                          quantity: _quantity,
                                          product: widget.product,
                                          color: _color!),
                                    ))),
                        color: defaultPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textColor: Colors.white,
                        elevation: 10,
                        child: Text(
                          "Buy now",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )),

                      //------Button add product to cart
                      Consumer<CartProvider>(
                        builder: (context, cartData, _) {
                          return IconButton(
                              onPressed: () {
                                cartData.addItem(CartItemModel(
                                    product: widget.product,
                                    quantity: _quantity,
                                    color: _color!,
                                    storage: _storage!));
                              },
                              icon: Icon(
                                CupertinoIcons.cart_badge_plus,
                                color: defaultPrimaryColor,
                                size: 30,
                              ));
                        },
                      ),

                      //------Button favorite
                      IconButton(
                          onPressed: () {
                            setState(() {
                              productsData.changeFavoriteAt(widget.index);
                            });
                          },
                          icon: Icon(
                            productsData.products[widget.index].isFavorite
                                ? CupertinoIcons.heart_solid
                                : CupertinoIcons.heart,
                            color: defaultPrimaryColor,
                            size: 30,
                          ))
                    ],
                  ),
                ),

                //------Feature Parity Product
                TextDivider(
                  child: Text(
                    "Parity Products",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 20, top: 10),
                  child: Container(
                      height: 230,
                      child: HorizontalListviewParityProduct(
                        product: productsData.products[widget.index],
                      )),
                ),
                TextDivider(
                  child: Text(
                    "Product details",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),

                DataTable(
                  columns: [
                    DataColumn(
                        tooltip: 'Các loại thông tin',
                        label: Text('Thông tin',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                    DataColumn(
                        tooltip: 'Thông số',
                        label: Text('Thông số',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Tên máy')),
                      DataCell(Text(widget.product.name)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Thương hiệu')),
                      DataCell(Text(widget.product.category)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Camera trước')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Camera sau')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('GPU')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Chip set')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Kích thước')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Loại pin')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Trọng lượng')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Kích thước màn hình')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Xuất xứ')),
                      DataCell(Text('...')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Chức năng khác')),
                      DataCell(Text('...')),
                    ]),
                  ],
                ),
                TextDivider(
                  child: Text(
                    "Product description",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Text(widget.product.shortDescription),
                ),
                SizedBox(height: 15),


                //------ RATING AND COMMENT
                Container(
                  width: size.width * 0.95,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            'Rating & Comment ${productsData.products[widget.index].name}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          SizedBox(height: 15),

                          //Get number of star - it will auto recalculate when you submit your rating
                          Text(
                            '${productsData.products[widget.index].getRating().toStringAsFixed(1)}/5',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          //View number of star - READ ONLY
                          RatingBar(
                            allowHalfRating: true,
                            initialRating:
                                productsData.products[widget.index].getRating(),
                            itemSize: 20,
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
                            height: 10,
                          ),

                          //Number of rating-comment in product
                          Text(
                            '${productsData.products[widget.index].feedbacks.length} rating & comment',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text('What do you think about this product ?'),
                          Consumer<UserProvider>(
                            builder: (context, usersData, _) {

                              //It show a dialog to write you rating
                              //CANCEL or SEND your rating, var rating and textField will clear
                              return MaterialButton(
                                  elevation: 10,
                                  color: defaultPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Rating now',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            elevation: 10,
                                            title: Text(
                                              "Rating",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepPurple),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                RatingBar(
                                                  allowHalfRating: true,
                                                  initialRating: rating,
                                                  itemSize: 40,
                                                  onRatingUpdate:
                                                      (double _rating) {
                                                    setState(() {
                                                      rating = _rating;
                                                    });
                                                  },
                                                  ratingWidget: RatingWidget(
                                                    full: Icon(
                                                      CupertinoIcons.star_fill,
                                                      color: Colors.amber,
                                                    ),
                                                    half: Icon(
                                                        CupertinoIcons
                                                            .star_lefthalf_fill,
                                                        color: Colors.amber),
                                                    empty: Icon(
                                                        CupertinoIcons
                                                            .star_fill,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                                Container(
                                                    child:
                                                        TextFieldCustomization(
                                                  controller: commentController,
                                                  isExpand: true,
                                                  label: 'Comment',
                                                  hintText:
                                                      'What do you think about this product ?',
                                                  isEdit: true,
                                                )),
                                              ],
                                            ),
                                            actions: [
                                              MaterialButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    productsData.addFeedbackIntoProductAt(
                                                        widget.index,
                                                        FeedbackModel(
                                                            user:
                                                                usersData.user,
                                                            rating: rating,
                                                            comment:
                                                                commentController
                                                                    .text,
                                                            time: DateFormat(
                                                                    'dd/MM/yyyy kk:mm:ss')
                                                                .format(DateTime
                                                                    .now())));
                                                    setState(() {
                                                      rating = 1;
                                                      commentController.clear();
                                                    });
                                                  },
                                                  color: defaultPrimaryColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    "SEND",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  )),
                                              MaterialButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      commentController.clear();
                                                      rating = 1;
                                                    });
                                                  },
                                                  color: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    "CANCEL",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          );
                                        });
                                  });
                            },
                          ),
                          SizedBox(height: 10),

                          //Show rating here
                          Column(
                            children: productsData
                                .products[widget.index].feedbacks
                                .map((feedbacks) {
                              return FeedbackItem(
                                feedback: feedbacks,
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
