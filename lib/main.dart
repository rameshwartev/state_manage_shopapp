import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_click_detail_screen.dart';
import './provider/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:ProductProvider(),
      // create: (ctx) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColorBrightness: Brightness.light,
            accentColor: Colors.red,
            fontFamily: 'Lato'
            // colorScheme: ColorScheme.light(
            //   onPrimary: Colors.red,
            //   onSecondary: Colors.amber,
            // ),
            ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductClickDetailScreen.routeName: (ctx) =>
              ProductClickDetailScreen()
        },
      ),
    );
  }
}
