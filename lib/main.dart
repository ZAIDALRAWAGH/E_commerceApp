import 'package:e_commerce/Provider/cart_provider.dart';
import 'package:e_commerce/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
