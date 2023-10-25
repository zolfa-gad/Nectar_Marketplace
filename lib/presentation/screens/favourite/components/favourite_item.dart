import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';
import '../../product/product_screen.dart';
import '../cubit/favourite_cubit.dart';
import '../cubit/favourite_state.dart';
import 'discount_favourite_item.dart';
import 'image_favourite_item.dart';
import 'name_favourite.dart';
import 'price_favourite_item.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  // final FavouriteModel product;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return Center(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            horizontalTitleGap: 10,
            // isThreeLine: true,
            // minLeadingWidth: 70,
            // minVerticalPadding: 30,

            leading: FavouriteItemImage(
              image: product.image,
            ),
            title: FavouriteItemName(
              name: product.name,
            ),
            subtitle: FavouriteItemDiscount(
              discount: product.discount!,
            ),
            trailing: FavouriteItemPrice(
              price: product.price,
            ),

            // onTap: () {},
            onTap: () {
              //     FavouriteCubit.get(context).getProductById(
              //   product.productId,
              // );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductScreen(
                      productItem: product,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

  // Padding(
        //   padding: const EdgeInsets.all(0),
        //   child: SizedBox(
        //     width: 70,
        //     child:
        //     Image.asset(
        //       // 'assets/images/Sprite.png',
        //       product.image,
        //       height: 70,
        //     ),
        //   ),
        // ),