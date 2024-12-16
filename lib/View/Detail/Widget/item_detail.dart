import 'package:e_commerce/Model/product_model.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final Product product;
  const ItemDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                //for rating
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kprimaryColor,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      product.review,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Slider: ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
