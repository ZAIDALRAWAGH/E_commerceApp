import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currenSlider;
  const ImageSlider(
      {super.key, required this.onChange, required this.currenSlider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      "images/slider.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "images/slider3.png",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "images/image1.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    viewportFraction: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned.fill(
        //   bottom: 10,
        //   left: 150,
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: List.generate(
        //         3,
        //         (index) => AnimatedContainer(
        //           duration: const Duration(seconds: 1),
        //           width: currenSlider == index ? 15 : 8,
        //           height: 8,
        //           margin: const EdgeInsets.only(right: 3),
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: currenSlider == index
        //                   ? Colors.black
        //                   : Colors.transparent,
        //               border: Border.all(
        //                 color: Colors.black,
        //               )),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
