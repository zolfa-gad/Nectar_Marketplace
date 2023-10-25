import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/models/product_model.dart';
import '../../../components/orange_button.dart';
import '../../../components/show_toast.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    Key? key,
    required this.prdouct,
  }) : super(key: key);

  final ProductModel prdouct;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return DefaultOrangeButton(
          text: addToBasketButton,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          onPressed: () {
            debugPrint('statement: ${prdouct.inCart}');

            if (prdouct.inCart) {
              ShowToast.get(
                msg: 'This item already exists in the basket.',
              );
            } else {
              ProductCubit.get(context).addItemToCarts(prdouct);
            }
          },
        );
      },
    );
  }
}
