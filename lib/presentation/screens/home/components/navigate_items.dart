import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/svg_icon_button.dart';
import '../../../components/text_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class NavigateItems extends StatelessWidget {
  const NavigateItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            cubit.navigateBarList.length,
            (index) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    cubit.changeNavigateScreenIndex(indx: index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgIconButton(
                        icon: cubit.navigateBarList[index].svgIcon,
                        color: cubit.navigateBarList[index].color,
                        onPressed: () {
                          cubit.changeNavigateScreenIndex(indx: index);
                        },
                      ),
                      // DefaultIconButton(
                      //   icon: cubit.navigateBarList[index].icon,
                      //   color: cubit.navigateBarList[index].color,
                      //   onPressed: () {
                      //     cubit.changeNavigateScreenIndex(indx:  index);
                      //   },
                      // ),
                      DefaultText(
                        text: cubit.navigateBarList[index].label,
                        size: 14,
                        weight: FontWeight.w600,
                        color: cubit.navigateBarList[index].color,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          // NavigateIcons.icons(context),
        );
      },
    );
  }
}
