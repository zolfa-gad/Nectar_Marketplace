import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shop/components/product_item.dart';
import '../cubit/custom_products_cubit.dart';
import '../cubit/custom_products_state.dart';

class CustomProductsList extends StatelessWidget {
  const CustomProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomProductsCubit, CustomProductsState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: CustomProductsCubit.get(context).productsList.length,
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
              product: CustomProductsCubit.get(context).productsList[index],
              generalHeight: 250,
            );
          },
        );
      },
    );
  }
}
