import 'package:flutter/material.dart';

import 'text_widget.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    Key? key,
    this.size,
    required this.text,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
  }) : super(key: key);

  final Size? size;
  final DefaultText text;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        // fixedSize: MaterialStateProperty.all(
        //   size,
        // ),
        minimumSize: MaterialStateProperty.all(size),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(
          padding,
        ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}
