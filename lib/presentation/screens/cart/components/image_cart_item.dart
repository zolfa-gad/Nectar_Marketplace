import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';
import '../../product/product_screen.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductScreen(
                productItem: product,
              );
            },
          ),
        );
      },
      child: Image.network(
        product.image,
        height: 200,
      ),
    );
  }
}
