import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import 'text_widget.dart';

class DefaultOrangeButton extends StatelessWidget {
  // static double width = double.infinity;
  // static Color? color = CustomColors.green;
  // this.color = CustomColors.green,
  // static double borderRadius = 15.0;
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final bool isEnabled;
  final Color? color;
  final IconData? leadingIcon;
  // final Widget? child;

  const DefaultOrangeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.isEnabled = true,
    this.color,
    this.leadingIcon,
    // this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MaterialButton(
          // onPressed: onPressed,
          onPressed: isEnabled ? onPressed : () {},
          height: 65,
          minWidth: 350,
          color: color ?? (isEnabled ? buttonColor : Colors.grey[400]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: leadingIcon == null
              ? DefaultText(
                  text: text,
                  size: 18,
                  weight: FontWeight.bold,
                  color: Colors.white,
                  // color: isEnabled ? Colors.white : Colors.black45,

                  letterSpacing: 1,
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.logout,
                        color: orangeColor,
                      ),
                      const Spacer(),
                      DefaultText(
                        text: text,
                        size: 18,
                        weight: FontWeight.bold,
                        color: orangeColor,
                        letterSpacing: 1,
                      ),
                      const Spacer()
                    ],
                  ),
                )),
    );
  }
}
