import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class ProductShopItemName extends StatelessWidget {
  const ProductShopItemName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: name,
      size: 18,
      weight: FontWeight.bold,
      color: Colors.black,
      align: TextAlign.left,
    );
  }
}
