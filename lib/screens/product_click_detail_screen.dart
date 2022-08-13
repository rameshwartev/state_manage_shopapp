import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductClickDetailScreen extends StatelessWidget {
  // final String? title;
  // ProductClickDetailScreen({this.title});
  static const routeName = 'product-detail';
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title!),
      ),
      body: Center(
        child: Text('Product Details'),
      ),
    );
  }
}
