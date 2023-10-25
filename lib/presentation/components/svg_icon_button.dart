import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback? onPressed;
  final double size;
  final EdgeInsets padding;

  const SvgIconButton({
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
        icon: SvgPicture.asset(
          icon,
          color: color,
        ),
        // Icon(
        //   icon,
        //   color: color,
        //   // size: size,
        // ),
      ),
    );
  }
}
