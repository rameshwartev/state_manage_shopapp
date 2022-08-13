import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_click_detail_screen.dart';
import '../provider/products.dart';

class ProductGridItem extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final String? imageUrl;
  // ProductGridItem({this.id, this.title, this.imageUrl});

  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    print('Product Rebuild');
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductClickDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                product.isFavorite! ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
