import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            Image.network(
                              product.imageUrl,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: IconButton(
                          icon: product.isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            product.toogleFavouriteStatus();
                          },
                          iconSize: 30,
                          color: product.isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('\$${product.price}'),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor,
                            offset: Offset(0, 10),
                            blurRadius: 8,
                            spreadRadius: -8,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 18,
                        child: IconButton(
                          icon: cart.itemsCount.bitLength > 1
                              ? const Icon(Icons.shopping_cart)
                              : const Icon(Icons.shopping_cart_outlined),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            cart.addItems(
                              product.id,
                              product.price,
                              product.title,
                              product.imageUrl,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Added to cart'),
                                duration: const Duration(seconds: 1),
                                action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    cart.removeSingleItem(product.id);
                                  },
                                ),
                              ),
                            );
                          },
                          iconSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
