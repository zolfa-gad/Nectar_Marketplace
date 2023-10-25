import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';
import '../../../components/text_widget.dart';

class CartItemName extends StatelessWidget {
  const CartItemName({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultText(
            text: product.name,
            color: Colors.black,
            size: 18,
            weight: FontWeight.bold,
            align: TextAlign.left,
          ),
          DefaultText(
            text: 'Discount: ${product.discount}',
            color: Colors.black54,
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
