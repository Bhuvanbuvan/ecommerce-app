// main.dart
import 'package:ecommerce/features/cart_screen/cart_screen.dart';
import 'package:ecommerce/features/category/cateogory_product_screen.dart';
import 'package:ecommerce/features/home_screen/dashboard_screen.dart';
import 'package:ecommerce/features/product_details/product_details.dart';
import 'package:ecommerce/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'features/auth_scren/authentication_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/product-details': (context) => ProductDetailsScreen(),
        '/cart': (context) => CartScreen(),
        '/category-products': (context) => CategoryProductsScreen(),
      },
    );
  }
}



// Don't forget to add the Timer import at the top







