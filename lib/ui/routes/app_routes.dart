import 'package:flutter/material.dart';
import 'package:las_delicias_de_mi_tierra/ui/screens/home/home_screen.dart';
import 'package:las_delicias_de_mi_tierra/ui/screens/product_detail/product_detail_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home_screen': (BuildContext context) => const HomeScreen(),
    'product_detail_screen': (BuildContext context) =>
        const ProductDetailScreen(),
  };
}
