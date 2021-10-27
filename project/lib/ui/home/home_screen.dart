import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:project/components/horizontal_listview.dart';
import 'package:project/ui/product/products_gridview.dart';
import 'package:project/ui/account_management/account_screen.dart';
import 'package:project/ui/orders_history/orders_screen.dart';
import 'package:project/ui/text_divider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget assetsCarousel = new Container(
      height: 200.0,
      child: new Carousel(
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
        indicatorBgPadding: 2.0,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(microseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Shop Mobile App'),
        actions: [
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header
            UserAccountsDrawerHeader(
              accountName: Text('Tran Linh'),
              accountEmail: Text('linhtranttdl@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),

            //body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AccountView())),
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OrdersScreen())),
              child: ListTile(
                title: Text('My order'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My favourite'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.dashboard, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //assets carousel begins here
          assetsCarousel,

          TextDivider(
            child: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          //horizontal list view begins here
          HorizontalList(),

          TextDivider(
            child: Text(
              'Recent products',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          //Grid view
          Container(
            height: 320,
            child: Products(),
          )
        ],
      ),
    );
  }
}
