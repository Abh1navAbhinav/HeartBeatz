import 'package:flutter/material.dart';
import 'package:heart_beatz/styles&colors/icon_gradient.dart';

import '../../objects.dart';

class ShufflePlayButton {
  Widget shuffleButton() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          child: Material(
            borderRadius: BorderRadius.circular(100),
            elevation: 5,
            shadowColor: Colors.blue,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: coloursObj.premiumBlue(),
              ),
              child: const RadiantGradientMask(
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 40,
          left: 43,
          child: Icon(Icons.shuffle),
        ),
      ],
    );
  }
}
