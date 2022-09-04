import 'package:flutter/material.dart';

class Colours {
  Gradient premiumBlack() {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 67, 67, 67),
        Color.fromARGB(255, 0, 0, 0),
      ],
    );
  }

  Gradient premiumBlue() {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 22, 217, 227),
        Color.fromARGB(255, 48, 199, 236),
        Color.fromARGB(255, 70, 174, 247),
      ],
    );
  }

  Gradient cloudyWhite() {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 253, 251, 251),
        Color.fromARGB(255, 235, 237, 238),
      ],
    );
  }
}
