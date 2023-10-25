import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favourite_cubit.dart';
import '../cubit/favourite_state.dart';
import 'favourite_item.dart';

class FavouriteItemsList extends StatelessWidget {
  const FavouriteItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: FavouriteCubit.get(context).favProductList.length,
                itemBuilder: (context, index) {
                  return FavouriteItem(
                    product: FavouriteCubit.get(context).favProductList[index],
                    // product: FavouriteCubit.get(context).myFavouritesList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Divider(
                      color: Colors.grey[300],
                      height: 10,
                      thickness: 2,
                    ),
                  );
                },
              ),
              Divider(
                color: Colors.grey[300],
                height: 10,
                thickness: 2,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}
