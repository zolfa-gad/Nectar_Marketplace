import 'package:flutter/material.dart';

import '../../data/models/label_model.dart';
import 'text_widget.dart';

class ScreenLabel extends StatelessWidget {
  // final String title;
  // final String subTitle;

  const ScreenLabel({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.left,
    this.labelAlign = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    // required this.title,
    // required this.subTitle,
  }) : super(key: key);

  final LabelModel label;
  final TextAlign textAlign;
  final CrossAxisAlignment labelAlign;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: labelAlign,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
              // text: title,
              text: label.primaryLabel,
              size: 26,
              weight: FontWeight.w600,
              color: Colors.black,
              align: textAlign,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultText(
              text: label.secondaryLabel,
              size: 16,
              weight: FontWeight.w500,
              color: Colors.grey,
              maxLines: 2,
              align: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}
