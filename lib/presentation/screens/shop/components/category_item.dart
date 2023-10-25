import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';
import '../../home/models/category_model.dart';
import '../../../components/text_widget.dart';
import '../../custom/custom_products_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        CategoryDataModel categoryItem =
            HomeCubit.get(context).categoriesList[index];
        return InkWell(
          child: Container(
            width: 250,
            height: 115,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color:
                  colorsList[index % colorsList.length][100].withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),

              // border: Border.all(
              //   color: colorsList[index % colorsList.length],
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  categoryItem.image,
                  height: 70,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DefaultText(
                    text: categoryItem.name,
                    size: 22,
                    weight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 1,
                    maxLines: 2,
                  ),
                ),
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
      },
    );
  }
}
