import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shop/components/product_item.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ResultProductsView extends StatelessWidget {
  const ResultProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        ExploreCubit cubit = ExploreCubit.get(context);
        return Expanded(
          child: GridView.builder(
            itemCount: cubit.sortedSearchResultList.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 250,
            ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              return ProductItem(
                product: cubit.sortedSearchResultList[index],
                generalHeight: 250,
              );
              // ProductCard(
              //   productItem: bloc.searchList[index],
              // );
            },
          ),
        );
      },
    );
  }
}
