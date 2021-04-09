import 'package:flutter/material.dart';
import 'package:flutter_shopp_app/providers/orders.dart';
import 'package:flutter_shopp_app/screens/cart_screen.dart';
import 'package:flutter_shopp_app/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shopp_app/providers/cart.dart';
import 'package:flutter_shopp_app/screens/product_detail.dart';
import 'package:flutter_shopp_app/screens/products_overview.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(
              create: (ctx) => Orders(),
          )
    ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.green,
          fontFamily: 'Lato'
        ),

        home: ProductsOverview(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}



