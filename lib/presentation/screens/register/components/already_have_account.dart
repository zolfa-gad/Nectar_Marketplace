import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/constants/colors.dart';
import '../../../../data/constants/screens.dart';
import '../../../components/text_button.dart';
import '../../../components/text_widget.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key}) : super(key: key);

  final String alreadyHaveAccount = 'Already have an account? ';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultText(
          text: alreadyHaveAccount,
          size: 14,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
        DefaultTextButton(
          size: const Size(45, 30),
          text: DefaultText(
            text: logInButton,
            size: 14,
            weight: FontWeight.w600,
            color: orangeColor,
            align: TextAlign.center,
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(logInScreen);
          },
        ),
      ],
    );
  }
}
