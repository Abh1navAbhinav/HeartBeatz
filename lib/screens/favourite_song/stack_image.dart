import 'package:flutter/material.dart';

import '../../objects.dart';

class StackImageClass {
  stackImage(BuildContext context) {
    Stack(
      children: [
        const Material(
          shadowColor: Colors.blue,
          elevation: 10,
          child: SizedBox(
            height: 260,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/weeknd.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 4,
          top: 40,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          top: 50,
          right: 10,
          child: Text(
            '20 Songs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Positioned(
          bottom: 8,
          left: 31,
          child: Text(
            'Favourite Songs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          right: 3,
          bottom: 1,
          child: shuffleButtonObj.shuffleButton(),
        ),
      ],
    );
  }
}
