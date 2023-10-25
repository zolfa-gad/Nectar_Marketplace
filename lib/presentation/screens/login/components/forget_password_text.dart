import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';
import '../../../components/text_button.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({Key? key}) : super(key: key);

  final String forgotText = 'Forgot Password?';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          const Spacer(),
          DefaultTextButton(
            text: const DefaultText(
              text: 'Forgot Password?',
              size: 14,
              weight: FontWeight.w500,
              color: Colors.black,
              align: TextAlign.right,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 17,
            ),
            onPressed: () {},
          ),
          // TextButton(
          //   style: ButtonStyle(
          //     alignment: Alignment.centerRight,
          //     // minimumSize: MaterialStateProperty.all(
          //     //   const Size(50, 20),
          //     // ),
          //     // fixedSize: MaterialStateProperty.all(
          //     //   const Size(50, 50),
          //     // ),
          //     // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     padding: MaterialStateProperty.all(
          //       const EdgeInsets.symmetric(
          //         vertical: 20,
          //         horizontal: 10,
          //       ),
          //     ),
          //   ),
          //   onPressed: () {},
          //   child: const CustomText(
          //     text: 'Forgot Password?',
          //     size: 14,
          //     weight: FontWeight.w500,
          //     color: Colors.black,
          //     align: TextAlign.right,
          //   ),
          // ),
        ],
      ),
    );

    //  InkWell(
    //   onTap: () {},
    //   child: const CustomText(
    //     text: 'Forgot Password?',
    //     size: 14,
    //     weight: FontWeight.w500,
    //     color: Colors.black,
    //     align: TextAlign.right,
    //   ),
    // );
  }
}
