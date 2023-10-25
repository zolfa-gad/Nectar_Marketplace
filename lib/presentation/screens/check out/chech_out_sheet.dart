import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_marketplace/presentation/screens/home/cubit/home_cubit.dart';

import '../../../data/constants/buttons.dart';
import '../../components/mixed_text.dart';
import '../cart/cubit/carts_cubit.dart';
import '../cart/cubit/carts_state.dart';
import 'components/bottom_sheet_title.dart';
import 'components/check_item.dart';
import 'components/payment_method.dart';
import 'components/place_order_button.dart';
import 'constants/consts.dart';
import 'dart:async';

class CheckOutSheet extends StatelessWidget {
  const CheckOutSheet({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartsCubit()..getMyCartsList(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomSheetTitle(
                  title: checkButton,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const CheckOutItem(
                  index: 0,
                ),
                const PaymentMethod(),
                const CheckOutItem(
                  index: 2,
                ),
                CheckOutItem(
                  index: 3,
                  totalPrice: totalPrice,
                ),
                MixedText(
                  stringsText: termText,
                  basicColor: Colors.black54,
                  differentColor: Colors.black,
                  fontSize: 15,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                ),
                PlaceOrderButton(
                  onPressed: () {
                    // Navigator.pop;
                    CartsCubit.get(context).placeNewOrder();

                    Future.delayed(const Duration(seconds: 2)).then((value) {
                      Navigator.of(context).pop();
                      CartsCubit.get(context).getMyCartsList();
                    });

                    // Navigator.of(context).pop();

                    // HomeCubit.get(context).refreshData();
                    // HomeCubit.get(context).getHomeImages();
                    // CartsCubit.get(context).getMyCartsList();
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


      // const DefaultText(
            //   text: 'By placing an order you agree to our Terms And Conditions',
            //   size: 18,
            //   maxLines: 2,
            //   align: TextAlign.left,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 5,
            //     vertical: 10,
            //   ),
            // ),

              // List tiles = [
  //   'Checkout',
  //   'Delivery',
  //   'Payment',
  //   'Promo Code',
  //   'Total Cost',
  // ];
  //  CheckOutItem(
                //   title: 'Delivery',
                //   value: 'Select Method',
                //   isEnabled: false,
                //   isArrowIcon: true,
                // ),
                // const PaymentTile(),
                //  CheckOutItem(
                //   title: 'Promo Code',
                //   value: 'Pick Discount',
                //   isEnabled: false,
                //   isArrowIcon: true,
                // ),
                // CheckOutItem(
                //   title: 'Total Cost',
                //   value: '$totalPrice',
                //   isEnabled: true,
                // ),