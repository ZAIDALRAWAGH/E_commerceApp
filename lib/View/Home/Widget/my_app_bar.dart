import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          icon: Image.asset(
            "images/icon.png",
            height: 20,
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor,
                padding: const EdgeInsets.all(20)),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined)),
      ],
    );
  }
}
