import 'package:cricket/searching_product/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatefulWidget {
  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text('Product Search')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // The search text field
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Search for products',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      final query = _controller.text;
                      print('Searching for query: $query');
                      context.read<ProductProvider>().searchProducts(query);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Consumer to listen to ProductProvider state
              Expanded(
                child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                    if (provider.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (provider.errorMessage.isNotEmpty) {
                      print('Error: ${provider.errorMessage}');
                      return Center(child: Text(provider.errorMessage));
                    } else if (provider.products.isEmpty &&
                        !_controller.text.isEmpty) {
                      return Center(child: Text('No products found.'));
                    } else if (provider.products.isEmpty) {
                      return SizedBox(); // No search yet
                    } else {
                      // Display product list
                      return ListView.builder(
                        itemCount: provider.products.length,
                        itemBuilder: (context, index) {
                          final product = provider.products[index];
                          return Card(
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16.0),
                              title: Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.description),
                                  SizedBox(height: 8.0),
                                  Text('Price: \$${product.price}'),
                                ],
                              ),
                              trailing: Image.network(
                                product.thumbnail,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
