import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/carts_cubit.dart';
import '../cubit/carts_state.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: CartsCubit.get(context).myCartsList.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    cartItem: CartsCubit.get(context).myCartsList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
