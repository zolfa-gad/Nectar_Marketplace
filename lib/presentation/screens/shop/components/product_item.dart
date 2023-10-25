import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';
import '../../product/cubit/product_cubit.dart';
import 'button_add_cart.dart';
import 'image_product.dart';
import 'name_product.dart';
import 'price_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.generalHeight,
  }) : super(key: key);

  final double generalHeight;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Container(
        width: 200,
        height: generalHeight,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black12,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: ProductItemImage(product: product)),
            const SizedBox(height: 10),
            ProductShopItemName(name: product.name),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(price: product.price),
                ProductToCartButton(product: product),
              ],
            )
          ],
        ),
      ),
    );
  }
}
