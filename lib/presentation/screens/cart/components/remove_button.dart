import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';
import '../../../components/icon_button.dart';
import '../cubit/carts_cubit.dart';

class RemoveCartItemButton extends StatelessWidget {
  const RemoveCartItemButton({Key? key, required this.product,}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return DefaultIconButton(
      icon: Icons.close,
      color: Colors.black54,
      onPressed: () {
        CartsCubit.get(context).removeItemFromCarts(
          product,
        );
        // remove from list
        // bloc.removeFromCart(item, '_');
        // bloc.snackBar(
        //   context,
        //   'Item removed successfully',
        // );
      },
    );
  }
}
