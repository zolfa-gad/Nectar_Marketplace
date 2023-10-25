import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';

import 'category_item.dart';

class EmptySearchFieldView extends StatelessWidget {
  const EmptySearchFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            itemCount: HomeCubit.get(context).categoriesList.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // mainAxisExtent: generalHeight,
            ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              return ExploreCategoryItem(
                categoryItem: HomeCubit.get(context).categoriesList[index],
                colorIndex: index % colorsList.length,
              );
            },
          ),
        );
      },
    );
  }
}
