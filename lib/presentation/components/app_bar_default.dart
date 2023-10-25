import 'package:flutter/material.dart';

import 'text_widget.dart';

class DefaultAppBar extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? actionIcon;
  // final title;
  final Widget? titleWidget;
  final String? titleText;
  final double? elevation;
  final Color? color;
  final bool? centerTitle;
  final double? height;

  const DefaultAppBar({
    Key? key,
    this.leadingIcon,
    this.actionIcon,
    // this.title = '',
    this.elevation,
    this.color,
    this.centerTitle,
    this.height,
    this.titleWidget,
    this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation, //3
      backgroundColor: color,
      centerTitle: centerTitle,
      toolbarHeight: height,
      // title: title,
      title: titleText == null
          ? titleWidget
          : DefaultText(
              text: titleText!,
              size: 20,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
      leading: leadingIcon,
      actions: actionIcon == null ? [] : [actionIcon!],
      // leading: Container(
      //   color: Colors.blue,
      //   child: DefaultIconButton(
      //     icon: leadingIcon,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      // actions: [
      //   actionIcon != null
      //       ? DefaultIconButton(
      //           icon: actionIcon!,
      //           onPressed: () {},
      //         )
      //       : Container(),
      // ],
    );
    //  Container(
    //   height: height,
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   decoration: BoxDecoration(
    //     color: color,
    //     boxShadow: [
    //       BoxShadow(
    //         offset: const Offset(0, 0),
    //         color: elevationColor,
    //         spreadRadius: 1,
    //         blurRadius: 2,
    //         blurStyle: BlurStyle.outer,
    //       ),
    //     ],
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       leadingIcon != null
    //           ? DefaultIconButton(
    //               icon: leadingIcon!,
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           : Container(),
    //       title,
    //       // angle: actionIcon == Icons.output_rounded ? math.pi / -2 : 0,
    //       actionIcon != null
    //           ? DefaultIconButton(
    //               icon: actionIcon!,
    //               onPressed: () {},
    //             )
    //           : Container(),
    //     ],
    //   ),
    // );
  }
}
