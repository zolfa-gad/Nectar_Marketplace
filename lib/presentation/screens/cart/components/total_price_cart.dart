import 'package:flutter/material.dart';

import '../../../../data/constants/fonts.dart';
import '../../../components/text_widget.dart';
import '../cubit/carts_cubit.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice({Key? key, required this.totalPrice}) : super(key: key);

  // final String totalPrice;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 80,
      width: CartsCubit.get(context).totalPrice.toString().length * 9.7,
      // width: totalPrice.toString().length * 9.7,
      // width: totalPrice.length*9.7,
      height: 40,
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DefaultText(
        // text: '\$ ${CartsCubit.get(context).totalPrice.toStringAsFixed(2)}',
        text: '\$ ${totalPrice.toStringAsFixed(2)}',
        // text: '\$ $totalPrice',
        size: 12,
        weight: FontWeight.w600,
        color: Colors.white,
        fontFamily: questrialFont,
      ),
    );
  }
}
