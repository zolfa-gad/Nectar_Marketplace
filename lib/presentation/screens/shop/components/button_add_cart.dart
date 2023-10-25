import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../components/show_toast.dart';
import '../../product/cubit/product_cubit.dart';
import '../../product/cubit/product_state.dart';

class ProductToCartButton extends StatelessWidget {
  const ProductToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return FloatingActionButton(
          mini: true,
          isExtended: true,
          heroTag: null,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.add,
            size: 28,
            color: Colors.white,
          ),
          onPressed: () {
            if (product.inCart) {
              ShowToast.get(
                msg: 'This item already exists in the basket.',
              );
            } else {
              ProductCubit.get(context).addItemToCarts(product);
            }
          },
        );
      },
    );
  }
}
