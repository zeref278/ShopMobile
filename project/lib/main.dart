import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/ui/account_management/account_screen.dart';
import 'package:project/ui/cart/cart_screen.dart';
import 'package:project/ui/home/home_screen.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/orders_history/orders_screen.dart';

import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuScreen(),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MenuScreenState();

}
class MenuScreenState extends State<MenuScreen> {
  var currentPage = DrawerSections.homescreen;
  String _currentScreen = 'Home';

  @override
  Widget build(BuildContext context) {

    var container;
    if (currentPage == DrawerSections.homescreen) {
      container = HomeScreen();
    } else if (currentPage == DrawerSections.account) {
      container = AccountView();
    } else if (currentPage == DrawerSections.orderhistory) {
      container = OrdersScreen();
    } else if (currentPage == DrawerSections.favorite) {
      container = AccountView();
    } else if (currentPage == DrawerSections.settings) {
      container = AccountView();
    } else if (currentPage == DrawerSections.about) {
      container = AccountView();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultPrimaryColor,
        title: Text(_currentScreen,),
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
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
                    child: Icon(CupertinoIcons.cart),
                  );
                },
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()))),
          SizedBox(width: 5)
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
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
                  decoration: BoxDecoration(color: defaultPrimaryColor),
                ),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", CupertinoIcons.house,
              currentPage == DrawerSections.homescreen ? true : false),
          menuItem(2, "Account", CupertinoIcons.person,
              currentPage == DrawerSections.account ? true : false),
          menuItem(3, "Order History", CupertinoIcons.arrow_2_squarepath,
              currentPage == DrawerSections.orderhistory ? true : false),
          menuItem(4, "Favorites", CupertinoIcons.square_favorites_alt,
              currentPage == DrawerSections.favorite ? true : false),
          Divider(),
          menuItem(5, "Settings", CupertinoIcons.gear_alt,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "About", CupertinoIcons.info_circle,
              currentPage == DrawerSections.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? defaultPrimaryColor.withOpacity(0.25) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              _currentScreen = 'Home';
              currentPage = DrawerSections.homescreen;
            } else if (id == 2) {
              _currentScreen = 'Account';
              currentPage = DrawerSections.account;
            } else if (id == 3) {
              _currentScreen = 'Order History';
              currentPage = DrawerSections.orderhistory;
            } else if (id == 4) {
              _currentScreen = 'Favorites';
              currentPage = DrawerSections.favorite;
            } else if (id == 5) {
              _currentScreen = 'Settings';
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              _currentScreen = 'About';
              currentPage = DrawerSections.about;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}





enum DrawerSections {
  homescreen,
  account,
  orderhistory,
  favorite,
  settings,
  about,
}
