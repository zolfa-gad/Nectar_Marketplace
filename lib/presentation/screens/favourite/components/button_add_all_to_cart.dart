import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../../product/cubit/product_cubit.dart';
import '../../product/cubit/product_state.dart';
import '../cubit/favourite_cubit.dart';

class AddAllToCartButton extends StatelessWidget {
  const AddAllToCartButton({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return DefaultOrangeButton(
          padding: padding,
          text: addAllCartButton,
          isEnabled:
              FavouriteCubit.get(context).favProductList.isEmpty ? false : true,
          onPressed: () {
            FavouriteCubit.get(context).addAllFavouriteToCart(context);
          },
        );
      },
    );
  }
}
