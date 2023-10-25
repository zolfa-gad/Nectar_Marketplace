// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';

import 'components/banners_images.dart';
import 'components/category_list.dart';
import 'components/product_list.dart';
import 'components/list_title.dart';
import 'components/app_bar_shop.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_state.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData(),
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          return Scaffold(
            body: NestedScrollView(
              // floatHeaderSlivers: true,
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, _) {
                return [
                  const ShopAppBar(),
                ];
              },
              body: state is ShopHomeDataLoadingState
                  ?
                  // ? state is! ShopHomeDataSuccessState
                  //     ? const Center(
                  //         child: CircularProgressIndicator(),
                  //       ):
                  const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            const BannersImages(),
                            const SizedBox(height: 20),
                            ListTitle(
                              title: bestSellingTitle,
                              productsList: ShopCubit.get(context).productsList,
                            ),
                            ProductList(
                              productsList: ShopCubit.get(context).productsList,
                            ),
                            const SizedBox(height: 20),
                            const ListTitle(
                              title: categoryTitle,
                              productsList: [],
                            ),
                            const CategoriesList(),
                            ShopCubit.get(context).productsOfferList.isNotEmpty
                                ? Column(
                                    children: [
                                      ListTitle(
                                        title: exclusiveOfferTitle,
                                        productsList: ShopCubit.get(context)
                                            .productsOfferList,
                                      ),
                                      ProductList(
                                        productsList: ShopCubit.get(context)
                                            .productsOfferList,
                                      ),
                                    ],
                                  )
                                : Container(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
