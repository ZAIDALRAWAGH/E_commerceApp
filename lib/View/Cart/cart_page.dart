import 'package:e_commerce/Provider/cart_provider.dart';
import 'package:e_commerce/View/Cart/cheek_out.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    //for quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQth(index)
                : provider.decrementQth(index);
          });
        },
        child: Icon(
          icon,
          size: 20,
        ),
      );
    }

    return Scaffold(
      //for total and cheek out
      bottomSheet: const CheekOut(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBar(),
                          ));
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItem = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(cartItem.image),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    cartItem.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "\$${cartItem.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  productQuantity(Icons.add, index),
                                  const SizedBox(width: 10),
                                  Text(
                                    cartItem.quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  productQuantity(Icons.remove, index),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
