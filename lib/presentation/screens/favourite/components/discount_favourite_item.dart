import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class FavouriteItemDiscount extends StatelessWidget {
  const FavouriteItemDiscount({
    Key? key,
    required this.discount,
  }) : super(key: key);

  final int discount;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      padding: const EdgeInsets.only(left: 2),
      text: 'Discount: $discount',
      size: 12,
      weight: FontWeight.w600,
      color: Colors.grey[400],
      align: TextAlign.left,
    );
  }
}
