import 'package:flutter/material.dart';

import '../../../components/image_slider.dart';

class ProductItemImagesList extends StatelessWidget {
  const ProductItemImagesList({
    Key? key,
    required this.productImages,
  }) : super(key: key);

  final List productImages;

  @override
  Widget build(BuildContext context) {
    return ImageSlider(
      height: 350,
      width: double.infinity,
      fraction: 1,
      
      imagesList: productImages,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      circlePadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 25,
      ),
      imageFit: BoxFit.contain,
    );
  }
}
