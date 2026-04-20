import 'dart:convert';

import 'package:auth_api_integration/models/product_model.dart';
import 'package:auth_api_integration/res/app_url.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  static Future<List<ProductModel>> getAllProducts({
    required int limit,
    required int skip,
  }) async {
    final url = Uri.parse("${AppUrl.products}?limit=$limit&skip=$skip");

    try {
      final response = await http.get(url);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final List list = data["products"];

        final products = list
            .map((product) => ProductModel.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception("Network error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
