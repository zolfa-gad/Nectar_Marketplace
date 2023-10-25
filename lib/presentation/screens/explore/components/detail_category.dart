import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class ExploreCategoryName extends StatelessWidget {
  const ExploreCategoryName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: name,
      size: 16,
      weight: FontWeight.bold,
      color: Colors.black,
      maxLines: 2,
    );
  }
}

class ExploreCategoryImage extends StatelessWidget {
  const ExploreCategoryImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 80,
    );
  }
}
