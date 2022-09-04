import 'package:flutter/material.dart';
import 'package:heart_beatz/objects.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       /*  Get.to(
          () => const PlayerScreen(),
          transition: Transition.downToUp,
          duration: const Duration(
            milliseconds: 600,
          ),
        ); */
      },
      child: Material(
        elevation: 5,
         borderRadius: BorderRadius.circular(17),
         shadowColor: Colors.blue,
        child: Container(
          height: 66,
          width: 332,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            gradient: coloursObj.premiumBlack(),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/images/weeknd.webp',
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 245,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: coloursObj.premiumBlue()),
                child: Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Row(
                    children: [
                      iconImage(
                        function: () {},
                        image: 'assets/icons/back.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: iconImage(
                          function: () {},
                          image: 'assets/icons/pause (1).png',
                        ),
                      ),
                      /* iconImage(
                        function: () {},
                        image: 'assets/icons/play-button (1).png',
                      ), */
                      iconImage(
                        function: () {},
                        image: 'assets/icons/next.png',
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconImage({
  required String image,
  required Function() function,
  double height = 32,
  double width = 32,
}) {
  return GestureDetector(
    onTap: function,
    child: Image(
      image: AssetImage(image),
      height: height,
      width: width,
    ),
  );
}
