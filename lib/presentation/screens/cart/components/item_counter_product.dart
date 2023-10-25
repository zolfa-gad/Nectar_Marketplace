import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/components/counter.dart';
import '../cubit/carts_cubit.dart';
import '../cubit/carts_state.dart';
import '../models/carts_model.dart';

class CartItemQuantity extends StatelessWidget {
  const CartItemQuantity({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  // final CartsModel product;
  // final VoidCallback increasePressed;
  // final VoidCallback? decreasePressed;
  // final int quantity;

  final CartsModel cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        return Row(
          children: [
            DecreaseButton(
              quantity: cartItem.quantity,
              onPressed: cartItem.quantity != 1
                  ? () {
                      CartsCubit.get(context).quantityDecrease(cartItem);
                    }
                  : null,
            ),
            CounterBox(
              quantity: cartItem.quantity,
            ),
            IncreaseButton(
              onPressed: () {
                CartsCubit.get(context).quantityIncrease(cartItem);
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
