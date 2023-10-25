import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/constants/images.dart';
import '../../../components/text_widget.dart';

class EmptyCartImage extends StatelessWidget {
  const EmptyCartImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(emptyBoxImage),
          DefaultText(
            padding: const EdgeInsets.symmetric(vertical: 20),
            text: 'Your cart is empty right now.',
            size: 20,
            weight: FontWeight.bold,
            color: orangeColor,
          )
        ],
      ),
    );
  }
}
