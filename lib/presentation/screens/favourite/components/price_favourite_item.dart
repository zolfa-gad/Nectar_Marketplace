import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class FavouriteItemPrice extends StatelessWidget {
  const FavouriteItemPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultText(
          text: '\$ $price',
          size: 16,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
        const SizedBox(width: 10),
        const Icon(
          Icons.arrow_forward_ios,
          size: 21,
          color: Colors.black54,
        ),
        // DefaultIconButton(
        //   padding: const EdgeInsets.only(left: 10),
        //   icon: Icons.arrow_forward_ios,
        //   onPressed: () {
        //     //gon to prouct page
        //   },
        // ),
      ],
    );
  }
}
