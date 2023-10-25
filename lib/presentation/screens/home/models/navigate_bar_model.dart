import 'package:flutter/material.dart';

class NavigateBarItem {
  // final IconData icon;
  // final SvgPicture? iconImage;
  final String svgIcon;
  final String label;
  Color color;

  NavigateBarItem({
    required this.svgIcon,
    // this.iconImage,
    required this.label,
    this.color = Colors.black,
  });
}
