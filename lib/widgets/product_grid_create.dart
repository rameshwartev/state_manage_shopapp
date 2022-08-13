import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_item.dart';
import '../provider/products.dart';

class ProductGridCreate extends StatelessWidget {
  // const product_grid_create({
  //   Key? key,
  //   required this.loadedProducts,
  // }) : super(key: key);

  // final List<Product> loadedProducts;
  final bool showFavs;
  ProductGridCreate(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductGridItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl,
            ),
      ),
    );
  }
}
