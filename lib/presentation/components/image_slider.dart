import 'package:flutter/material.dart';

import '../screens/home/cubit/home_cubit.dart';
import 'carousel_slider.dart';
import 'circle_slider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    required this.width,
    required this.height,
    required this.imagesList,
    required this.borderRadius,
    required this.circlePadding,
    required this.fraction,
    required this.imageFit,
    this.autoPlay = false,
  }) : super(key: key);

  final double width;
  final double height;
  final List imagesList;
  final BorderRadius borderRadius;
  final EdgeInsets circlePadding;
  final double fraction;
  final BoxFit imageFit;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      alignment: Alignment.bottomCenter,
      children: [
        CarouselImageSlider(
          autoPlay: autoPlay,
          borderRadius: borderRadius,
          width: width,
          height: height,
          imagesList: imagesList,
          fraction: fraction,
          imageFit: imageFit,
          onPageChanged: (index, reason) {
            // if (imagesList.length > 5) {
            //   ShopCubit.get(context).changeImageIndex(index % 4);
            // } else {
            HomeCubit.get(context).changeSliderImageIndex(
              index,
              imagesList.length,
            );
            // }
          },
        ),
        CircleSlider(
          padding: circlePadding,
          length: imagesList.length,
        ),
      ],
    );
  }
}
// imgList.asMap().values.map((e) {
//         return ImageSlider(
//           width: 200,
//           height: 100,
//           borderRadius: BorderRadius.circular(20),
//           padding: 0,
//           // imagePath: e,
//         );
//       }).toList(),