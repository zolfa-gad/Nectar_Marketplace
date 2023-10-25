// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../../check out/chech_out_sheet.dart';
import '../../check out/components/show_bottom_sheet.dart';
import '../cubit/carts_cubit.dart';
import '../cubit/carts_state.dart';
import 'total_price_cart.dart';

class GoToCheckButton extends StatelessWidget {
  GoToCheckButton({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;
  // String totalPrice = '0';
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          // totalPrice = CartsCubit.get(context).totalPrice.toStringAsFixed(2);
          totalPrice = CartsCubit.get(context).totalPrice;
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              DefaultOrangeButton(
                text: checkButton,
                isEnabled: CartsCubit.get(context).isEnabledButton,
                onPressed: () {
                  ShowBottomSheet.get(
                    context: context,
                    // child: SizedBox(
                    //   height: 450,
                    //   child: CheckOutSheet(totalPrice: totalPrice),
                    // ),
                    builder: (_) {
                      return SizedBox(
                        height: 450,
                        child: CheckOutSheet(totalPrice: totalPrice),
                      );
                    },
                  );
                  // CartsCubit.get(context).getMyCartsList();
                },
              ),
              CartTotalPrice(
                totalPrice: totalPrice,
              ),
            ],
          );
        },
      ),
    );
  }
}



  // final List<LabelModel> list = [
  //   LabelModel(
  //     primaryLabel: 'CheckOut',
  //     secondaryLabel: '',
  //   ),
  //   LabelModel(
  //     primaryLabel: 'Delivery',
  //     secondaryLabel: 'Select Method',
  //   ),
  //   LabelModel(
  //     primaryLabel: 'Payment',
  //     secondaryLabel: '',
  //   ),
  //   LabelModel(
  //     primaryLabel: 'Promo Code',
  //     secondaryLabel: 'Pick Discount',
  //   ),
  //   LabelModel(
  //     primaryLabel: 'Total Cost',
  //     secondaryLabel: '${CartsCubit.get(context).totalPrice}',
  //   ),
  // ];

  // List tiles = [
  //   'Checkout',
  //   'Delivery',
  //   'Payment',
  //   'Promo Code',
  //   'Total Cost',
  // ];

//   Checkout
// Delivery
// Select Method

// Pament
// Promo Code
// Total Cost

// By placing an order you agree to our
// Terms And Conditions
// Go to Checkout
