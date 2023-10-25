import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../../custom/custom_products_screen.dart';
import '../../home/models/category_model.dart';
import 'detail_category.dart';

class ExploreCategoryItem extends StatelessWidget {
  const ExploreCategoryItem({
    Key? key,
    required this.categoryItem,
    required this.colorIndex,
  }) : super(key: key);

  final CategoryDataModel categoryItem;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 165,
        height: 150,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: colorsList[colorIndex][100].withOpacity(0.5),
          border: Border.all(color: colorsList[colorIndex]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ExploreCategoryImage(image: categoryItem.image),
            const SizedBox(
              height: 15,
            ),
            ExploreCategoryName(name: categoryItem.name),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              // String title =
              // ShopCubit.get(context).categoriesList[index].name;
              // int id = ShopCubit.get(context).categoriesList[index].id;
              return CustomProductsScreen(
                id: categoryItem.id,
                title: categoryItem.name,
              );
            },
          ),
        );
      },
    );
  }
}
