import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return LayoutBuilder(builder: (context, constraints) {
      return MasonryGridView.count(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: const ProductItem(),
        ),
        itemCount: products.length,
      );
    });
  }
}
