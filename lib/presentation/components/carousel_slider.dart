import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatelessWidget {
  const CarouselImageSlider({
    Key? key,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.imagesList,
    required this.fraction,
    required this.imageFit,
    this.autoPlay = false,
    required this.onPageChanged,
  }) : super(key: key);

  final BorderRadius borderRadius;
  final double width;
  final double height;
  final List imagesList;
  final double fraction;
  final BoxFit imageFit;
  final bool autoPlay;
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagesList.map(
        (image) {
          return Container(
            width: width,
            height: height,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              // color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  offset: Offset(0, 0),
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey,
                )
              ],
              borderRadius: borderRadius,
              border: Border.all(
                color: Colors.black12,
              ),

              image: DecorationImage(
                image: NetworkImage(image),
                fit: imageFit,
            
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        // autoPlay: true,
        autoPlay: autoPlay,
        height: height,
        initialPage: 0,
        aspectRatio: height / width,
        reverse: false,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        pauseAutoPlayOnManualNavigate: true,
        viewportFraction: fraction,
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        onPageChanged: onPageChanged,
        // onPageChanged: (index, reason) {
        //   // if (imagesList.length > 5) {
        //   //   ShopCubit.get(context).changeImageIndex(index % 4);
        //   // } else {
        //   HomeCubit.get(context).changeSliderImageIndex(
        //     index,
        //     imagesList.length,
        //   );
        //   // }
        // },
      ),
    );
  }
}
