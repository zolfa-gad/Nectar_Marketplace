import 'package:flutter/material.dart';

import '../../../../data/constants/titles.dart';
import '../../../../data/models/label_model.dart';
import '../../../components/icon_button.dart';
import '../../../components/screen_label.dart';

class NumberAppBar extends StatelessWidget {
  const NumberAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appBarHeight * 2.5,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: DefaultIconButton(
              icon: Icons.arrow_back_ios_new,
              onPressed: onPressed,
            ),
          ),
          const Spacer(),
          ScreenLabel(
            padding: const EdgeInsets.only(bottom: 10),
            textAlign: TextAlign.left,
            label: LabelModel(
              primaryLabel: 'Enter your mobile number',
              secondaryLabel: '',
            ),
          ),
        ],
      ),
    );
  }
}
