import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final VoidCallback? onPressed;
  // final Function() onPressed;
  // final Function()? onPressed;
  final double size;
  final EdgeInsets padding;

  const DefaultIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = Colors.black,
    this.size = 25,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        splashRadius: 25,
        alignment: Alignment.center,
        iconSize: size,
        constraints: BoxConstraints(
          maxWidth: size,
        ),
        icon: Icon(
          icon,
          color: color,
          // size: size,
        ),
      ),
    );
  }
}
