import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/constants/colors.dart';
import '../../../../data/constants/screens.dart';
import '../../../components/text_button.dart';
import '../../../components/text_widget.dart';

class NotHaveAccount extends StatelessWidget {
  const NotHaveAccount({Key? key}) : super(key: key);

  final String notHaveAccountText = 'Don\'t have an account? ';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultText(
          text: notHaveAccountText,
          size: 14,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
        DefaultTextButton(
          size: const Size(55, 30),
          padding: EdgeInsets.zero,
          text: DefaultText(
            text: signUpButton,
            size: 14,
            weight: FontWeight.w600,
            color: orangeColor,
            align: TextAlign.center,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(signUpScreen);
          },
        )
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
        //   child: CustomText(
        //     text: signUpButton,
        //     size: 14,
        //     weight: FontWeight.w600,
        //     color: greenColor,
        //   ),
        // ),

        // InkWell(
        //   onTap: () {
        //     Navigator.of(context).pushReplacementNamed(signUpScreen);
        //   },
        //   child: CustomText(
        //     text: signUpButton,
        //     size: 14,
        //     weight: FontWeight.w600,
        //     color: greenColor,
        //   ),
        // ),
      ],
    );
  }
}
