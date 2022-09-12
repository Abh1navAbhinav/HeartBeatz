// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../styles&colors/icon_gradient.dart';

class SongTile extends StatelessWidget {
  SongTile({
    Key? key,
    required this.liked,
    required this.songImage,
    required this.subtitle,
    required this.title,
    this.function,
  }) : super(key: key);
  bool liked = false;

  String title;
  String subtitle;
  Widget songImage;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        
        borderRadius: BorderRadius.circular(5),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(25),
          child: songImage,
          
        ),
      ),
      title: Text(
        title,
        // overflow: TextOverflow.fade,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        overflow: TextOverflow.fade,
        maxLines: 1,
      ),
      trailing: RadiantGradientMask(
        child: /* IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
          color: Colors.white,
        ), */
            IconButton(
          onPressed: () {},
          icon: liked == false
              ? const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                )
              : RadiantGradientMask(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    color: Colors.white,
                  ),
                ),
        ),
      ),
      onTap: function,
    );
  }
}
