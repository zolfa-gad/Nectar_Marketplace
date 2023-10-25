import 'package:flutter/material.dart';

class MixedText extends StatelessWidget {
  const MixedText({
    Key? key,
    required this.stringsText,
    this.alignment = Alignment.centerLeft,
    required this.differentColor,
    this.basicColor = Colors.black,
    this.fontSize = 14,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final List stringsText;
  final AlignmentGeometry alignment;
  final Color differentColor;
  final Color basicColor;
  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: padding,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            color: basicColor,
            height: 1.5,
          ),
          children: List.generate(
            stringsText.length,
            (index) {
              return TextSpan(
                text: stringsText[index][0],
                style: stringsText[index][1]
                    ? TextStyle(
                        color: differentColor,
                        fontWeight: FontWeight.bold,
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
