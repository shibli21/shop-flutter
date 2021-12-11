import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widget/product_item.dart';

class ProductsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
          child: ProductItem(
            products[itemIndex].id,
            products[itemIndex].title,
            products[itemIndex].imageUrl,
            products[itemIndex].price,
          ),
        ),
        options: CarouselOptions(
          aspectRatio: 1 / 2,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          autoPlay: true,
          disableCenter: true,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
