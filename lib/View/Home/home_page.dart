import 'package:e_commerce/Model/product_model.dart';
import 'package:e_commerce/View/Home/Widget/image_slider.dart';
import 'package:e_commerce/View/Home/Widget/my_search.dart';
import 'package:e_commerce/View/Home/Widget/product_cart.dart';
import 'package:flutter/material.dart';

import '../../Model/category.dart';
import 'Widget/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currenSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              //for custom AppBar
              const myAppBar(),
              const SizedBox(height: 20),
              //for search
              const MySearch(),
              const SizedBox(height: 20),
              //for image slider
              ImageSlider(
                currenSlider: currenSlider,
                onChange: (p0) {
                  setState(() {
                    currenSlider = p0;
                  });
                },
              ),
              const SizedBox(height: 20),
              //for category selection
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: selectedIndex == index // this selected index
                              ? Colors.blue[200]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage(categoriesList[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              categoriesList[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //for text
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special for you",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              //for shopping item
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: selectedCategory[selectedIndex]
                    .length, //this selected index must be same
                itemBuilder: (context, index) {
                  return ProductCart(
                      myProduct: selectedCategory[selectedIndex][index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
