import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class PanelItemTitle extends StatelessWidget {
  const PanelItemTitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: label,
      color: Colors.black,
      size: 18,
      weight: FontWeight.w600,
      align: TextAlign.left,
    );
  }
}
