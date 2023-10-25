import 'package:flutter/material.dart';

import '../../home/cubit/home_cubit.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 130, //115
        child: ListView.builder(
          itemCount: HomeCubit.get(context).categoriesList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) {
            return CategoryItem(index: index);
          },
        ),
      ),
    );
  }
}
