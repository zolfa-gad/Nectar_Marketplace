import 'package:flutter/material.dart';
import 'package:nectar_marketplace/presentation/screens/explore/components/search_bar.dart';

import '../../../../data/constants/titles.dart';
import '../../../components/app_bar_default.dart';
import '../../../components/icon_button.dart';
import '../../home/cubit/home_cubit.dart';

import '../cubit/explore_cubit.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({
    Key? key,
    required this.autofocus,
    required this.searchController,
    required this.isVisibleTitle,
  }) : super(key: key);

  final bool autofocus;
  final bool isVisibleTitle;

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          !HomeCubit.get(context).isVisibleSearchTitle
              ? const DefaultAppBar(
                  titleText: exploreBarTitle,
                  elevation: 0,
                )
              : Container(),
          SizedBox(
            height: appBarHeight - 5,
            child: Center(
              child: CustomSearchBar(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 10,
                //   vertical: 10,
                // ),
                // padding: EdgeInsets.fromLTRB(
                //   15,
                //   ExploreCubit.get(context).isVisibleTitle ? 0 : 10,
                //   15,
                //   10,
                // ),
                controller: searchController,
                autofocus: autofocus,
                suffixIcon: DefaultIconButton(
                  icon: Icons.cancel,
                  color: Colors.grey,
                  size: 22,
                  onPressed: () {
                    ExploreCubit.get(context).searchController.clear();
                    ExploreCubit.get(context).isFirstSearchState(value: true);
                  },
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    ExploreCubit.get(context).isFirstSearchState(value: false);
                    ExploreCubit.get(context).getFilteredList(text);
                  }
                },
                onTap: () {
                  // ExploreCubit.get(context).hideTitle();
                  HomeCubit.get(context).hideExploreAppBar(true);
                },
              ),
            ),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     ExploreCubit.get(context).isVisibleTitle
      //         ? const DefaultAppBar(
      //             // height: 70,

      //             elevation: 0,
      //             title: 'Find Products',
      //             // elevationColor: Colors.transparent,
      //             // title: DefaultText(
      //             //   padding: EdgeInsets.symmetric(vertical: 22),
      //             //   text: 'Find Products',
      //             //   size: 20,
      //             //   weight: FontWeight.bold,
      //             //   color: Colors.black,
      //             // ),
      //           )
      //         : Container(),
      //     // ? AppBar(
      //     //     elevation: 0,
      //     //     centerTitle: true,
      //     //     toolbarHeight: 65,
      //     //     backgroundColor: Colors.transparent,
      //     //     title: const DefaultText(
      //     //       text: 'Find Products',
      //     //       size: 20,
      //     //       weight: FontWeight.bold,
      //     //       color: Colors.black,
      //     //     ),
      //     //   )
      //     // : Container(),
      //     // ? const DefaultText(
      //     //     padding: EdgeInsets.symmetric(vertical: 22),
      //     //     text: 'Find Products',
      //     //     size: 20,
      //     //     weight: FontWeight.bold,
      //     //     color: Colors.black,
      //     //   )
      //     // : Container(),

      //     SearchBar(
      //       padding: EdgeInsets.fromLTRB(
      //         15,
      //         ExploreCubit.get(context).isVisibleTitle ? 0 : 10,
      //         15,
      //         10,
      //       ),
      //       controller: searchController,
      //       autofocus: autofocus,
      //       suffixIcon: DefaultIconButton(
      //         icon: Icons.cancel,
      //         color: Colors.grey,
      //         size: 22,
      //         onPressed: () {
      //           ExploreCubit.get(context).searchController.clear();
      //           ExploreCubit.get(context).isFirstSearchState(value: true);
      //         },
      //       ),
      //       onChanged: (text) {
      //         if (text.isNotEmpty) {
      //           ExploreCubit.get(context).isFirstSearchState(value: false);
      //           ExploreCubit.get(context).getFilteredList(text);
      //         }
      //       },
      //     ),
    );
  }
}
