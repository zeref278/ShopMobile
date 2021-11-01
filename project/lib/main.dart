
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/cart_provider.dart';

import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/drawer_customization/menu_screen.dart';


import 'package:provider/provider.dart';



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
          create: (context) => ProductProvider(),
        ),
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

