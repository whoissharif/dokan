import 'dart:convert';

import 'package:dokan/app/modules/product/model/product_model.dart';
import 'package:flutter/services.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProduct() async {
    final String response =
        await rootBundle.loadString('assets/jsons/product.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
