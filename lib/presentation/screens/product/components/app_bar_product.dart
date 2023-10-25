import 'package:flutter/material.dart';

import '../../../components/app_bar_default.dart';
import '../../../components/carousel_slider.dart';
import '../../../components/icon_button.dart';
import '../../../components/orange_button.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    Key? key,
    required this.productImages,
  }) : super(key: key);

  final List productImages;

  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      color: Colors.white30,
      elevation: 0,
      leadingIcon: DefaultIconButton(
        icon: Icons.arrow_back_ios_new,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actionIcon: DefaultIconButton(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        icon: Icons.open_in_new_outlined,
        onPressed: () {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                actions: [
                  SizedBox(
                    width: 100,
                    child: DefaultOrangeButton(
                      text: 'Close',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
                content: SizedBox(
                  width: screenWidth - 50,
                  height: screenHeight - 200,
                  child: CarouselImageSlider(
                    borderRadius: BorderRadius.circular(10),
                    width: double.infinity,
                    height: double.infinity,
                    autoPlay: true,
                    imagesList: productImages,
                    fraction: 1,
                    imageFit: BoxFit.contain,
                    onPageChanged: (index, _) {},
                  ),
                ),
              );
            },
          );
        },
      ),
    );

    // const InvisibleAppBar(
    //   height: 50,
    //   actionIcon: Icons.open_in_new_outlined,
    //   title: Text(''),
    //   color: Colors.white,
    // );
  }
}
