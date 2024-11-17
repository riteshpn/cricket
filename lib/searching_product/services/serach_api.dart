import 'dart:convert';

import 'package:cricket/searching_product/model/data_model/search_data_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String baseUrl = 'https://dummyjson.com/products/search';

  Future<ProductResponse?> searchProducts(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?q=$query'));
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }
}
