import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';

class JsonGetProducts {
  static Future<List<ProductEntity>> readProductsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product_list.json');
    final data = await jsonDecode(response);
    final List<dynamic> productList = data['products'];
    return productList
        .map((product) => ProductEntity.fromJson(product))
        .toList();
    // print(data.toString());
  }
}
