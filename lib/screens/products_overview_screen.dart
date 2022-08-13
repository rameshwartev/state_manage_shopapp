import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/product_grid_item.dart';
import '../widgets/product_grid_create.dart';
import '../provider/product_provider.dart';

enum FilterOption {
  favorite,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectValue) {
              setState(
                () {
                  if (selectValue == FilterOption.favorite) {
                    showOnlyFavorites = true;
                  } else {
                    showOnlyFavorites = false;
                  }
                },
              );
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOption.favorite,
              ),
              const PopupMenuItem(
                child: Text('Show all'),
                value: FilterOption.all,
              ),
            ],
          ),
        ],
      ),
      body: ProductGridCreate(showOnlyFavorites),
    );
  }
}
