import 'package:flutter/material.dart';

class FavouriteItemImage extends StatelessWidget {
  const FavouriteItemImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 200,
    );
  }
}
