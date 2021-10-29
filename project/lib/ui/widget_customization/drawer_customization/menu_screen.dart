import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/account_management/account_screen.dart';
import 'package:project/ui/cart/cart_screen.dart';
import 'package:project/ui/home/home_screen.dart';
import 'package:project/ui/orders_history/orders_screen.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  var currentPage = DrawerSections.homescreen;
  String _currentScreen = 'Shop Mobile';

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.homescreen) {
      container = HomeScreen();
    } else if (currentPage == DrawerSections.profile) {
      container = ProfileScreen();
    } else if (currentPage == DrawerSections.orderhistory) {
      container = OrdersScreen();
    } else if (currentPage == DrawerSections.favorite) {
      container = ProfileScreen();
    } else if (currentPage == DrawerSections.settings) {
      container = ProfileScreen();
    } else if (currentPage == DrawerSections.about) {
      container = ProfileScreen();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultPrimaryColor,
        title: Text(
          _currentScreen,
        ),
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
                Consumer<UserProvider>(builder: (context, userData, _) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                      userData.user.userName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(userData.user.email),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(userData.user.avatarPath),
                      ),
                    ),
                    decoration: BoxDecoration(color: defaultPrimaryColor),
                  );
                }),
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
          menuItem(1, "Shop Mobile", CupertinoIcons.shopping_cart,
              currentPage == DrawerSections.homescreen ? true : false),
          menuItem(2, "Profile", CupertinoIcons.person,
              currentPage == DrawerSections.profile ? true : false),
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
      color:
          selected ? defaultPrimaryColor.withOpacity(0.25) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            _currentScreen = title;
            if (id == 1) {
              currentPage = DrawerSections.homescreen;
            } else if (id == 2) {
              currentPage = DrawerSections.profile;
            } else if (id == 3) {
              currentPage = DrawerSections.orderhistory;
            } else if (id == 4) {
              currentPage = DrawerSections.favorite;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
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
                      fontWeight: FontWeight.w600),
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
  profile,
  orderhistory,
  favorite,
  settings,
  about,
}