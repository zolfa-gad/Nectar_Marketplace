import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../components/icon_button.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return DefaultIconButton(
          icon: product.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: favIconColor,
          size: 26,
          // color: Colors.black54,
          onPressed: () {
            ProductCubit.get(context).reverseFavouriteButton(product);
            // if (product.isFavourite) {
            //   ShowToast.get(
            //     msg: 'Item added to favourites list successfully',
            //   );
            // } else {
            //   ShowToast.get(
            //     msg: 'Item removed from favourites list successfully',
            //   );
            // }
          },
        );
      },
    );
  }
}
