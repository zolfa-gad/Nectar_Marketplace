import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_marketplace/presentation/screens/shop/cubit/shop_cubit.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../product/cubit/product_cubit.dart';
import 'components/carts_list.dart';
import 'components/button_go_to_check.dart';
import 'components/empty_cart_image.dart';
import 'cubit/carts_cubit.dart';
import 'cubit/carts_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => CartsCubit()..getMyCartsList(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        // BlocProvider(
        //   create: (context) => HomeCubit(),
        // ),
      ],
      child: BlocConsumer<CartsCubit, CartsState>(
        listener: (context, state) {
          debugPrint('statement: Carts Listener');
          if (!CartsCubit.get(context).cartStatus ||
              state is PlaceOrderSuccessState) {
            CartsCubit.get(context).getMyCartsList();
          }
        },
        builder: (context, state) {
          return BlocBuilder<CartsCubit, CartsState>(
            builder: (context, state) {
              return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterFloat,
                floatingActionButton: GoToCheckButton(),
                appBar: const PreferredSize(
                  preferredSize: Size(
                    double.infinity,
                    appBarHeight,
                  ),
                  child: DefaultAppBar(
                    titleText: cartsBarTitle,
                  ),
                ),
                body: state is CartsGetCartsListLoadingState ||
                        state is PlaceOrderLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CartsCubit.get(context).myCartsList.isEmpty
                        ? const EmptyCartImage()
                        : state is PlaceOrderSuccessState
                            ? CartsCubit.get(context).getMyCartsList()
                            : const CartItemsList(),
              );
            },
          );
        },
      ),
    );
  }
}
