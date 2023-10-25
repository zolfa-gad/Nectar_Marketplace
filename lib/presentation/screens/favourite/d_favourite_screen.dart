// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../product/cubit/product_cubit.dart';
import 'components/button_add_all_to_cart.dart';
import 'components/empty_favourite_image.dart';
import 'components/favourite_list.dart';
import 'cubit/favourite_cubit.dart';
import 'cubit/favourite_state.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouriteCubit()..getFavouritesList(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
          debugPrint('statement: Favourite Listener');

          if (!FavouriteCubit.get(context).favStatus) {
            debugPrint('statement: Getting favs list items');
            FavouriteCubit.get(context).getFavouritesList();
            debugPrint('Fav: ${FavouriteCubit.get(context).myFavouritesList}');
          }

          // if (state is ProductGetByIdSuccessState) {
          //   debugPrint('statement: ProductGetByIdSuccessState');
          //   // Navigator.of(context).push(
          //   //   MaterialPageRoute(
          //   //     builder: (context) {
          //   //       return ProductScreen(
          //   //         productItem: FavouriteCubit.get(context).productModelItem!,
          //   //       );
          //   //     },
          //   //   ),
          //   // );
          // }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            floatingActionButton: const AddAllToCartButton(),
            appBar: const PreferredSize(
              preferredSize: Size(
                double.infinity,
                appBarHeight,
              ),
              child: DefaultAppBar(titleText: favouriteBarTitle),
            ),
            body: state is FavouriteGetListLoadingState ||
                    FavouriteCubit.get(context).favProductList.length !=
                        FavouriteCubit.get(context).myFavouritesList.length
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FavouriteCubit.get(context).favProductList.isEmpty
                    ? const EmptyFavouriteImage()
                    : const FavouriteItemsList(),
          );
        },
      ),
    );
  }
}
