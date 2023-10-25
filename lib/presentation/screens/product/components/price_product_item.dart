import 'package:flutter/material.dart';

import '../../../../data/constants/fonts.dart';
import '../../../components/text_widget.dart';

class ProductItemPrice extends StatelessWidget {
  const ProductItemPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: '\$ $price',
      size: 24,
      weight: FontWeight.bold,
      color: Colors.black,
      fontFamily: questrialFont,
    );
  }
}
