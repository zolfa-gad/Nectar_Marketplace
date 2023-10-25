import 'package:flutter/material.dart';

import 'orange_button.dart';
import 'text_widget.dart';

class ShowDialog {
  static get({
    required BuildContext context,
    required VoidCallback onPressed,
    required String primaryText,
    required String secondaryText,
    required String buttonText,
    required String image,
    double? height,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          iconPadding: const EdgeInsets.all(15),
          // actionsPadding: const EdgeInsets.all(20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          // icon: Align(
          //   alignment: Alignment.centerRight,
          //   child: DefaultIconButton(
          //     icon: Icons.close,
          //     color: Colors.black54,
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: height,
                  child: Image.asset(image),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultText(
                  text: primaryText,
                  size: 26,
                  weight: FontWeight.bold,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultText(
                  text: secondaryText,
                  size: 16,
                  weight: FontWeight.w400,
                  maxLines: 2,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          actions: [
            DefaultOrangeButton(
              text: buttonText,
              padding: const EdgeInsets.all(20),
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}
