import 'package:e_commerce/Model/product_model.dart';
import 'package:e_commerce/View/Detail/Widget/detail_addto_cart.dart';
import 'package:e_commerce/View/Detail/Widget/detail_app_bar.dart';
import 'package:e_commerce/View/Detail/Widget/detail_description.dart';
import 'package:e_commerce/View/Detail/Widget/detail_image_slider.dart';
import 'package:e_commerce/View/Detail/Widget/item_detail.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currenImageIndex = 0;
  int currenSliderIndex = 0;
  int currenColorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      //for add to cart , icon and quanity
      floatingActionButton: DetailAddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //for back button share and favorite
              DetailAppBar(
                product: widget.product,
              ),
              //for detail image slider
              DetailImageSlider(
                  onChange: (p0) {
                    setState(() {
                      currenImageIndex = p0;
                    });
                  },
                  image: widget.product.image),
              const SizedBox(height: 10),
              //for index slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currenSliderIndex == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currenSliderIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //for product name,price,rating, and seller
                    ItemDetail(product: widget.product),
                    const SizedBox(height: 20),
                    //for color
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currenColorIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currenColorIndex == index
                                  ? null
                                  : widget.product.colors[index],
                              border: currenColorIndex == index
                                  ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                  : null,
                            ),
                            margin: const EdgeInsets.only(right: 15),
                            padding: currenColorIndex == index
                                ? const EdgeInsets.all(2)
                                : null,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: widget.product.colors[index],
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    //for description
                    DetailDescription(description: widget.product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
