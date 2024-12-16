import 'package:e_commerce/Model/product_model.dart';
import 'package:e_commerce/Provider/cart_provider.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class DetailAddToCart extends StatefulWidget {
  final Product product;
  const DetailAddToCart({super.key, required this.product});

  @override
  State<DetailAddToCart> createState() => _DetailAddToCartState();
}

class _DetailAddToCartState extends State<DetailAddToCart> {
  int currenIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (currenIndex != 1) {
                        setState(() {
                          currenIndex--;
                        });
                      }
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    currenIndex.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currenIndex++;
                      });
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.toggleFavorite(widget.product);
                const snackBar = SnackBar(
                  content: Text(
                    "Successful added! ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
