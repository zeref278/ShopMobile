import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/providers/order_provider.dart';
import 'package:project/providers/user_provider.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
