import 'package:cricket/searching_product/model/data_model/search_data_model.dart';
import 'package:cricket/searching_product/model/domain_model/search_domain_model.dart';
import 'package:cricket/searching_product/services/serach_api.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductDomain> _products = [];
  bool _loading = false;
  String _errorMessage = '';

  List<ProductDomain> get products => _products;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      _errorMessage = 'Please enter a search query';
      notifyListeners();
      return;
    }

    _loading = true;
    _errorMessage = '';
    notifyListeners(); // Notify UI that loading has started

    print('Fetching products for query: $query');

    final responseService = ProductRepository();

    try {
      ProductResponse? productResponse =
          await responseService.searchProducts(query);
      print('API response received for query: $query');

      _products.clear(); // Clear previous results

      if (productResponse?.products != null &&
          productResponse!.products!.isNotEmpty) {
        print('Products found: ${productResponse.products!.length}');
        _products = productResponse.products!.map((product) {
          print('Mapping product: ${product.toString()}'); // Debug line
          return ProductDomain(
            id: product.id!,
            title: product.title!,
            description: product.description!,
            category: product.category!,
            price: (product.price is int)
                ? (product.price as int).toDouble()
                : product.price as double,
            thumbnail: product.thumbnail!,
          );
        }).toList();
        _errorMessage = ''; // Clear error if products are found
      } else {
        _errorMessage = 'No products found for "$query".';
        print(_errorMessage);
      }

      print('Products list updated, notifying listeners...');
      notifyListeners(); // Notify UI about the product list update
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}'; // Handle any errors
      print(_errorMessage);
      notifyListeners(); // Notify UI about the error
    } finally {
      _loading = false;
      notifyListeners(); // Notify UI that loading has finished
    }
  }
}
