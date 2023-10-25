import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/constants/fonts.dart';
import '../../../components/icon_button.dart';
import '../../../components/text_widget.dart';

class DecreaseButton extends StatelessWidget {
  const DecreaseButton({
    Key? key,
    required this.quantity,
    required this.onPressed,
  }) : super(key: key);

  final int quantity;
  // final ProductModel product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultIconButton(
      icon: Icons.horizontal_rule,
      size: 30,
      color: quantity == 1 ? Colors.black26 : orangeColor,
      onPressed: onPressed,
    );
  }
}

class CounterBox extends StatelessWidget {
  const CounterBox({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultText(
        text: '$quantity',
        // text: bloc.productCount.toString(),
        size: 18,
        weight: FontWeight.w600,
        color: Colors.black,
        fontFamily: questrialFont,
      ),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultIconButton(
      icon: Icons.add,
      size: 30,
      color: orangeColor,
      onPressed: onPressed,
      // () {
      //   // bloc.productIncrease(item);
      //   // item.increasCounter();
      // },
    );
  }
}
