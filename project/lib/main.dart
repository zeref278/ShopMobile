import 'package:flutter/material.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/ui/home/home_screen.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:provider/provider.dart';
//my own imports

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
        home: HomeScreen(),
      ),
    );
  }
}
