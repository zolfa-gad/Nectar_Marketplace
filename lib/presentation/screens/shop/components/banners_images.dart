import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/image_slider.dart';
import '../cubit/shop_cubit.dart';
import '../cubit/shop_state.dart';

class BannersImages extends StatelessWidget {
  const BannersImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return ImageSlider(
          autoPlay: false,
          height: 200,
          width: double.infinity,
          fraction: 0.9,
          imagesList: ShopCubit.get(context).bannersImagesList,
          // imagesList: imagesList,
          borderRadius: BorderRadius.circular(20),
          circlePadding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 10,
          ),
          imageFit: BoxFit.cover,
        );
      },
    );
  }
}
