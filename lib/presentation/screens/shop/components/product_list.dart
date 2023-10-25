import 'package:flutter/material.dart';

import 'product_item.dart';


class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final double generalHeight = 250;
  final List productsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
          height: generalHeight,
          child: ListView.separated(
            itemCount: productsList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            itemBuilder: (context, index) {
              return ProductItem(
                product: productsList[index],
                generalHeight: generalHeight,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
          )
          // GridView.builder(
          //   itemCount: productsList.isEmpty ? 0 : 5,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: const EdgeInsets.all(10),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisExtent: 250,
          //     mainAxisSpacing: 14,
          //     crossAxisSpacing: 14,
          //   ),
          //   itemBuilder: (context, index) {
          //     return ProductItem(
          //       product: productsList[index],
          //       generalHeight: generalHeight,
          //     );
          //   },
          // ),
          ),
    );
  }
}
  // SizedBox(
        //   width: double.infinity,
        //   height: generalHeight,
        //   child: ListView.separated(
        //     itemCount: productsList.length,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return ProductItem(
        //         generalHeight: generalHeight,
        //         product: productsList[index],
        //       );
        //     },
        //     separatorBuilder: (context, index) => const SizedBox(
        //       width: 10,
        //     ),
        //   ),
        // );