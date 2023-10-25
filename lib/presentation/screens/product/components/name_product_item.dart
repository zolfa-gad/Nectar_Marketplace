import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class ProductItemName extends StatelessWidget {
  const ProductItemName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: name,
      color: Colors.black,
      size: 24,
      weight: FontWeight.bold,
      align: TextAlign.left,
      maxLines: 3,
      lineHeight: 1.5,
    );
  }
}
