import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop/config/app_theme.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screen/auth_screen.dart';
import 'package:shop/screen/cart_screen.dart';
import 'package:shop/screen/orders_screen.dart';
import 'package:shop/screen/product_detail_screen.dart';
import 'package:shop/screen/product_overview_screen.dart';
import 'package:shop/screen/user_products_screen.dart';
import 'package:shop/screen/edit_product_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        // ChangeNotifierProvider(create: (ctx) => Orders()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders("", "", []),
          update: (ctx, auth, previousProducts) => Orders(
            auth.token!,
            auth.userId!,
            previousProducts!.orders,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', '', []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token!,
            auth.userId!,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, _) {
        return MaterialApp(
          title: 'MyShop',
          theme: AppTheme.basic,
          home:
              auth.isAuth ? const ProductsOverviewScreen() : const AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => const EditProductScreen(),
          },
        );
      }),
    );
  }
}
