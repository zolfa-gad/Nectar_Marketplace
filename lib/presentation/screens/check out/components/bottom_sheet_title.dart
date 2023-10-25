import 'package:flutter/material.dart';

import '../../../components/icon_button.dart';
import '../../../components/text_widget.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Row(
            children: [
              DefaultText(
                text: title,
                size: 22,
                weight: FontWeight.bold,
                color: Colors.black,
                align: TextAlign.left,
              ),
              const Spacer(),
              DefaultIconButton(
                icon: Icons.close,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 2,
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
