import 'package:e_commerce/Model/product_model.dart';
import 'package:e_commerce/Provider/favorite_provider.dart';
import 'package:e_commerce/View/Detail/detail_page.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final Product myProduct;
  const ProductCart({super.key, required this.myProduct});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: myProduct,
              ),
            ));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Hero(
                    tag: myProduct.image,
                    child: Image.asset(
                      myProduct.image,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    myProduct.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${myProduct.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        myProduct.colors.length,
                        (index) => Container(
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: myProduct.colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //for favorite icon
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.toggleFavorite(myProduct);
                  },
                  child: Icon(
                    provider.isExist(myProduct)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
