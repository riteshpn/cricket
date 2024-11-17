import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricket/searching_product/view_model/search_view_model.dart';
import 'package:cricket/searching_product/pages/search_ui.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              ProductProvider(), // Initialize with a default query
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductSearchScreen(),
    );
  }
}
