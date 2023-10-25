import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  final String title = 'Welcome\nto our store';
  final String subTitle = 'Ger your groceries in as fast as one hour';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultText(
          text: title,
          size: 48,
          weight: FontWeight.w600,
          color: Colors.white,
          maxLines: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultText(
          text: subTitle,
          size: 16,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }
}
