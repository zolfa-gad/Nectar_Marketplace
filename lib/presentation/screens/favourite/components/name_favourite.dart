import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class FavouriteItemName extends StatelessWidget {
  const FavouriteItemName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: name,
      size: 16,
      weight: FontWeight.bold,
      color: Colors.black,
      align: TextAlign.left,
    );
  }
}
