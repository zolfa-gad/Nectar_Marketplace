import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';
import '../../shop/components/product_item.dart';
import '../cubit/see_all_cubit.dart';
import '../cubit/see_all_state.dart';

class SeeAllProductsList extends StatelessWidget {
  const SeeAllProductsList({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllCubit, SeeAllState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: productsList.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 250,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productsList[index],
              generalHeight: 250,
            );
          },
        );
      },
    );
  }
}
