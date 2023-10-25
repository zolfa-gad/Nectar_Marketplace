import 'package:flutter/material.dart';

import '../../../components/icon_button.dart';
import '../../../components/text_widget.dart';
import '../constants/consts.dart';

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({
    Key? key,
    this.onTap,
    required this.index,
    this.totalPrice,
  }) : super(key: key);

  final VoidCallback? onTap;
  final int index;
  final double? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  DefaultText(
                    text: checkItems[index].title,
                    size: 18,
                    weight: FontWeight.w500,
                    color: checkItems[index].isEnabled
                        ? Colors.black
                        : Colors.black45,
                    align: TextAlign.left,
                  ),
                  const Spacer(),
                  DefaultText(
                    text: checkItems[index].id == 'cost'
                        ? '$totalPrice'
                        : checkItems[index].value ?? '',
                    size: 16,
                    // weight: isBold ? FontWeight.bold : FontWeight.w500,
                    color: checkItems[index].isEnabled
                        ? Colors.black
                        : Colors.black45,
                    // align: TextAlign.right,
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  checkItems[index].iconWidget ?? Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  checkItems[index].id == 'cost'
                      ? Container()
                      : const DefaultIconButton(
                          icon: Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 20,
                          onPressed: null,
                        ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}

  // hasIcon
                  //     ? icon != null
                  //         ? Icon(
                  //             icon,
                  //             color: title == 'Payment'
                  //                 ? Colors.redAccent.shade700
                  //                 : Colors.black,
                  //           )
                  //         : const Icon(
                  //             Icons.arrow_forward_ios,
                  //             color: Colors.black,
                  //           )
                  // ? DefaultIconButton(
                  //     icon: icon,
                  //     color: title == 'Payment'
                  //         ? Colors.redAccent.shade700
                  //         : Colors.black,
                  //     onPressed: onPressed,
                  //   )
                  // : DefaultIconButton(
                  //     icon: Icons.arrow_forward_ios,
                  //     color: Colors.black45,
                  //     onPressed: onPressed,
                  //   )
                  //     : Container(),

  //  Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Padding(
    //       padding: padding,
    //       child: ListTile(
    //         title: DefaultText(
    //           text: title,
    //           size: isBold ? 22 : 18,
    //           weight: isBold ? FontWeight.bold : FontWeight.w500,
    //           color: isEnabled ? Colors.black : Colors.black45,
    //           align: TextAlign.left,
    //         ),
    //         trailing: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             isPayment
    //                 // ? SvgIconButton(
    //                 //     icon: paymentSvgIcon,
    //                 //     color: Colors.red[700]!,
    //                 //     // size: 50,
    //                 //     onPressed: null,
    //                 //   )
    //                 ? Icon(
    //                     Icons.payment,
    //                     color: Colors.red[700]!,
    //                     size: 28,
    //                   )
    //                 : DefaultText(
    //                     text: value,
    //                     size: 18,
    //                     color: isEnabled ? Colors.black : Colors.black45,
    //                     align: TextAlign.center,
    //                   ),
    //             isCost
    //                 ? Container()
    //                 : Padding(
    //                     padding: const EdgeInsets.only(left: 10),
    //                     child: Icon(
    //                       icon,
    //                       color: isEnabled ? Colors.black : Colors.black45,
    //                     ),
    //                   ),
    //             // DefaultIconButton(
    //             //   icon: Icons.arrow_forward_ios,
    //             //   onPressed: () {},
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Divider(
    //       height: 3,
    //       thickness: 2,
    //       color: Colors.grey[200],
    //       indent: 20,
    //       endIndent: 20,
    //     ),
    //   ],
    // );


// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 7),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: onTap,
//             child: SizedBox(
//               height: 50,
//               child: Row(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   DefaultText(
//                     text: title,
//                     size: 18,
//                     weight: FontWeight.w500,
//                     color: isEnabled ? Colors.black : Colors.black45,
//                     align: TextAlign.left,
//                   ),
//                   const Spacer(),
//                   DefaultText(
//                     text: value,
//                     size: 16,
//                     // weight: isBold ? FontWeight.bold : FontWeight.w500,
//                     color: isEnabled ? Colors.black : Colors.black45,
//                     // align: TextAlign.left,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   //widgetIcon
//                   //arrow icon
//                   isArrowIcon
//                       ? const DefaultIconButton(
//                           icon: Icons.arrow_forward_ios,
//                           color: Colors.black54,
//                           size: 20,
//                           onPressed: null,
//                         )
//                       : widgetIcon ?? Container(),
//                                 ],
//               ),
//             ),
//           ),
//           Divider(
//             height: 1,
//             thickness: 2,
//             color: Colors.grey[200],
//           ),
//         ],
//       ),
//     );
