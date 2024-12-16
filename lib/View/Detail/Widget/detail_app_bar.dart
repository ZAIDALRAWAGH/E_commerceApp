import 'package:flutter/material.dart';

import '../../../Model/product_model.dart';
import '../../../Provider/favorite_provider.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: Icon(
              provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
