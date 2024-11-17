import 'package:cricket/search_api/api_service_phone.dart';
import 'package:cricket/searching_product/model/data_model/search_data_model.dart';
import 'package:flutter/material.dart';

class ProductSearchScreen1 extends StatefulWidget {
  @override
  _ProductSearchScreen1State createState() => _ProductSearchScreen1State();
}

class _ProductSearchScreen1State extends State<ProductSearchScreen1> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();
  ProductResponse? _results;
  bool _isLoading = false;

  void _searchProducts() async {
    if (_controller.text.isEmpty) {
      setState(() {
        _results = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _results = null;
    });

    try {
      final results = await _apiService.searchProducts(_controller.text);
      setState(() {
        _results = results;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _results = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Search for products',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchProducts,
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _results != null && _results!.products != null
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _results!.products!.length,
                          itemBuilder: (context, index) {
                            final product = _results!.products![index];
                            return Card(
                              elevation: 4,
                              color: Colors.lightGreen,
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(16.0),
                                title: Text(
                                  product.title ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.description ??
                                        'No Description'),
                                    SizedBox(height: 8.0),
                                    Text('Price: \$${product.price}'),
                                    SizedBox(height: 4.0),
                                    Text('Rating: ${product.rating ?? 'N/A'}'),
                                    SizedBox(height: 4.0),
                                    Text('Stock: ${product.stock ?? 'N/A'}'),
                                  ],
                                ),
                                trailing: Image.network(
                                  product.thumbnail ?? '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
