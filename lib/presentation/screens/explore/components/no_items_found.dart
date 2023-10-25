import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/constants/images.dart';
import '../../../components/text_widget.dart';

class NoItemsFoundView extends StatelessWidget {
  const NoItemsFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                DefaultText(
                  text: 'No Items Found!',
                  weight: FontWeight.bold,
                  size: 20,
                  color: orangeColor,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  searchImage,
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
