import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailNewPrice;
  final productDetailOldPrice;
  final productDetailPicture;

  ProductDetails(
      {this.productDetailName,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailPicture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Shop Mobile App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(widget.productDetailPicture),
                  )
                  // child: Image.asset(widget.productDetailPicture),
                  ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                    leading: new Text(widget.productDetailName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("${widget.productDetailOldPrice} VNĐ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  decoration: TextDecoration.lineThrough)),
                        ),
                        Expanded(
                            child: new Text(
                          "${widget.productDetailNewPrice} VNĐ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )),
                      ],
                    )),
              ),
            ),
          ),

          //==================== The first buttons==================

          Row(
            children: <Widget>[
              //======The Storage button
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Storage"),
                          content: new Text("Choose the storage capacity"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Storage")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),

              ////======The Color button
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose the color"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Color")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),

              //======The Quantity button
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),
            ],
          ),

          //=========The second button=============

          Row(
            children: <Widget>[
              //======The size button
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Buy now"),
              )),

              new IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red)),
              new IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, color: Colors.red))
            ],
          ),
          Divider(),
          new ListTile(title: new Text("Product details")),

          new ListTile(
            title: DataTable(
              columns: [
                DataColumn(
                    label: Text('Thông tin kỹ thuật',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Thông số kỹ thuật',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Thương hiệu')),
                  DataCell(Text(widget.productDetailName)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Xuất xứ thương hiệu')),
                  DataCell(Text('...')),
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
                  DataCell(Text('Độ phân giải')),
                  DataCell(Text('...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Chức năng khác')),
                  DataCell(Text('...')),
                ]),
              ],
            ),
          ),
          new ListTile(
            title: new Text("Mô tả sản phẩm"),
            subtitle: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                  'nisi ut aliquip ex ea commodo consequat'),
            ),
            // subtitle: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
            //     " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            //     "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
            //     "nisi ut aliquip ex ea commodo consequat. "),
          )
        ],
      ),
    );
  }
}
