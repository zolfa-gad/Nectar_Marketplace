import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../explore/components/search_bar.dart';
import '../../explore/cubit/explore_cubit.dart';
import '../../explore/cubit/explore_state.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';

class ShopAppBarTitle extends StatelessWidget {
  const ShopAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SearchBar(
              onTap: () {
                if (state is NavigationScreenIndexState) {
                  ExploreCubit.get(context).hideTitle();
                  debugPrint('statement: hideTitle in if');
                }
                debugPrint('statement: hideTitle');
                if (HomeCubit.get(context).screenIndex != 1) {
                  HomeCubit.get(context).changeNavigateScreenIndex(
                    indx: 1,
                    onTap: true,
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
