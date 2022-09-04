import 'package:flutter/material.dart';

import '../../styles&colors/icon_gradient.dart';

class FavGridHome {
  Widget favGrid() {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(50),
              child: const Image(
                image: AssetImage('assets/images/weeknd.webp'),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Positioned(
            left: 55,
            top: 55,
            child: RadiantGradientMask(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
