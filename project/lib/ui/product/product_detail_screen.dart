import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/product.dart';
import 'package:project/ui/text_divider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isFavorite = false;
  String? _storage;
  String? _color;
  int _quantity = 1; // Option 2

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storage = widget.product.storageAvailable.first;
    _color = widget.product.colorAvailable.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Shop Mobile App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
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
                      )
                      // child: Image.asset(widget.productDetailPicture),
                      ),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: new Text(widget.product.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        title: Row(
                          children: <Widget>[
                            Expanded(
                              child: new Text(
                                  "${formatter.format(widget.product.oldPrice)} VNĐ",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      decoration: TextDecoration.lineThrough)),
                            ),
                            Expanded(
                                child: new Text(
                              "${formatter.format(widget.product.price)} VNĐ",
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
              Text(
                'Select Option',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                width: 250,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Storage'),
                        DropdownButton(
                          //hint: Text('Please choose a location'), // Not necessary for Option 1
                          value: _storage,
                          onChanged: (String? newValue) {
                            setState(() {
                              _storage = newValue;
                            });
                          },
                          items:
                              widget.product.storageAvailable.map((location) {
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
                        Text('Color'),
                        DropdownButton(
                          //hint: Text('Please choose a location'), // Not necessary for Option 1
                          value: _color,
                          onChanged: (String? newValue) {
                            setState(() {
                              _color = newValue;
                            });
                          },
                          items: widget.product.colorAvailable.map((location) {
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
                              icon: Icon(Icons.remove),
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
                              icon: Icon(Icons.add),
                              onPressed:
                                  _quantity == widget.product.quantityRemaining
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
                    //======The size button
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: Text("Buy now"),
                    )),

                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart, color: Colors.red)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red))
                  ],
                ),
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
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Text(widget.product.shortDescription),
              )
            ],
          ),
        ),
      ),
    );
  }
}
