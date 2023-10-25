import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../components/icon_button.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ReviewButtons extends StatelessWidget {
  const ReviewButtons({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) {
              return DefaultIconButton(
                icon: index <= product.review ? Icons.star : Icons.star_border,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                // size: 30,
                color: favIconColor,
                onPressed: () {
                  ProductCubit.get(context).updateReviewStars(
                    index,
                    product,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
