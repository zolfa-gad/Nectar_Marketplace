import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import 'counter.dart';

class ProductItemCount extends StatelessWidget {
  const ProductItemCount({
    Key? key,
    required this.product,
  }) : super(key: key);

  // final CartsModel product;
  // final VoidCallback increasePressed;
  // final VoidCallback? decreasePressed;
  // final int quantity;

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Row(
          children: [
            DecreaseButton(
              quantity: product.itemCount,
              onPressed: product.itemCount != 1
                  ? () {
                      ProductCubit.get(context).itemCountDecrease(product);
                    }
                  : null,
            ),
            CounterBox(
              quantity: product.itemCount,
            ),
            IncreaseButton(
              onPressed: () {
                ProductCubit.get(context).itemCountIncrease(product);
              },
              // () {
              //   ProductCubit.get(context).itemCountIncrease(product);
              // },
            ),
          ],
        );
      },
    );
  }
}
