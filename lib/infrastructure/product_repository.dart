import 'dart:convert';

import 'package:einkaufswagen22/infrastructure/product.dart';
import 'package:flutter/services.dart';

class ProductRepository {
  Future<List<Product>> findAll() async {
    String jsonFile = await rootBundle.loadString('assets/data/products.json');
    final jsonArray = json.decode(jsonFile) as Iterable;

    List<Product> products =
        List<Product>.from(jsonArray.map((e) => Product.fromJson(e)));

    return Future.value(products);
  }
}
