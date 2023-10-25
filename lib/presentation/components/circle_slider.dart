// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../screens/home/cubit/home_cubit.dart';
import '../screens/home/cubit/home_state.dart';

class CircleSlider extends StatelessWidget {
  CircleSlider({
    Key? key,
    required this.padding,
    required this.length,
  }) : super(key: key);

  final EdgeInsets padding;
  final int length;
  late int imageIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        imageIndex = HomeCubit.get(context).imageSliderIndex;

        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              length > 5 ? 5 : length,
              (index) {
                return Container(
                  width: index == imageIndex ? 25 : 10,
                  height: index == imageIndex ? 9 : 10,
                  margin: padding,
                  // EdgeInsets.symmetric(
                  //   // vertical: 2,
                  //   // horizontal: 4,
                  //   vertical: verticalPadding,
                  //   horizontal: horizontalPadding,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius:
                        index == imageIndex ? BorderRadius.circular(5) : null,
                    shape: index == imageIndex
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    color: index == imageIndex
                        ? selectedIndecatorColor
                        : unselectedIndecatorColor,
                  ),
                );
              },
            )

            // ListView.builder(
            //   itemCount: ShopCubit.get(context).banners.length,
            //   scrollDirection: Axis.horizontal,
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       width: 12.0,
            //       height: 12.0,
            //       margin: const EdgeInsets.symmetric(
            //         vertical: 8.0,
            //         horizontal: 4.0,
            //       ),
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.green,
            //         // color: (Theme.of(context).brightness == Brightness.dark
            //         //         ? Colors.white
            //         //         : Colors.black)
            //         //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
            //       ),
            //     );
            //   },
            // ),

            // children: ShopCubit.get(context).banners.map(
            //   (entry) {
            //     return GestureDetector(
            //       onTap: () {
            //         debugPrint('hgcfzsbnc');
            //         debugPrint(entry.toString());
            //         // _controller.animateToPage(entry.key);
            //       },
            //       child: Container(
            //         width: 12.0,
            //         height: 12.0,
            //         margin: const EdgeInsets.symmetric(
            //           vertical: 8.0,
            //           horizontal: 4.0,
            //         ),
            //         decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.green,
            //           // color: (Theme.of(context).brightness == Brightness.dark
            //           //         ? Colors.white
            //           //         : Colors.black)
            //           //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
            //         ),
            //       ),
            //     );
            //   },
            // ).toList(),
            );
      },
    );
  }
}
