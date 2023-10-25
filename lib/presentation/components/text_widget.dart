// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../data/constants/fonts.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign align;
  final int maxLines;
  final EdgeInsets padding;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;
  final String? fontFamily;

  const DefaultText({
    Key? key,
    required this.text,
    required this.size,
    this.weight,
    this.color,
    this.align = TextAlign.center,
    this.maxLines = 1,
    this.padding = EdgeInsets.zero,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontFamily = robotoFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          // overflow: TextOverflow.clip,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: lineHeight,
        ),
        overflow: TextOverflow.ellipsis,
        // maxLines: 2,
        maxLines: maxLines,
        softWrap: true,
        textAlign: align,
      ),
    );
  }
}
