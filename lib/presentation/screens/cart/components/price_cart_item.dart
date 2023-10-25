import 'package:flutter/material.dart';

import '../../../../data/constants/fonts.dart';
import '../../../components/text_widget.dart';

class CartItemPrice extends StatelessWidget {
  const CartItemPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: '\$ $price',
      size: 18,
      weight: FontWeight.w600,
      color: Colors.black,
      fontFamily: questrialFont,
    );
  }
}
