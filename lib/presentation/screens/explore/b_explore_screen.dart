import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../home/cubit/home_cubit.dart';
import '../shop/cubit/shop_cubit.dart';
import '../shop/cubit/shop_state.dart';
import 'components/app_bar_explore.dart';
import 'components/empty_search_field.dart';
import 'components/no_items_found.dart';
import 'components/result_products.dart';
import 'cubit/explore_cubit.dart';
import 'cubit/explore_state.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    Key? key,
    required this.autofocus,
    required this.isVisibleTitle,
  }) : super(key: key);

  final bool autofocus;
  final bool isVisibleTitle;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchAllData(),
        ),
        BlocProvider(
          create: (context) => ShopCubit(),
        ),
        BlocProvider(
          create: (context) => ExploreCubit(),
        ),
      ],
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          if (state is ShopHomeDataSuccessState) {
            ExploreCubit.get(context).getAllProducts(
              ShopCubit.get(context).productsList,
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(
                    double.infinity,
                    !HomeCubit.get(context).isVisibleSearchTitle
                        ? appBarHeight * 2
                        : appBarHeight,
                  ),
                  child: ExploreAppBar(
                    autofocus: autofocus,
                    isVisibleTitle: isVisibleTitle,
                    searchController:
                        ExploreCubit.get(context).searchController,
                  ),
                ),
                body: BlocBuilder<ExploreCubit, ExploreState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // seachFieldView(state),

                        ExploreCubit.get(context).isFirstSearch
                            ? const EmptySearchFieldView()
                            : state is ExploreSearchResultLoadingState ||
                                    state is ShopHomeDataLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ExploreCubit.get(context).isEmptySearch
                                    ? const NoItemsFoundView()
                                    : const ResultProductsView()
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}


// seachFieldView(state) {
  //   if (state is ExploreIsFirstSearchState) {
  //     return const EmptySearchFieldView();
  //   } else if (state is ExploreSearchResultLoadingState) {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   } else if (state is ExploreIsEmptySearchState) {
  //     return Center(child: Image.asset(emptyBoxImage));
  //   } else {
  //     return const ResultProductsView();
  //   }
  // }


    //       body: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 20,
    //                 vertical: 5,
    //               ),
    //               child: SearchBar(
    //                   bloc: bloc,
    //                   controller: searchController,
    //                   onChanged: (text) {
    //                     // bloc.searchList = [];
    //                     bloc.updateSearchList(searchController.text);
    //                   }
    //                   // onChanged: (text) {
    //                   //   print(text);
    //                   //   if (text != '') {
    //                   //     // for (var element in itemsList) {
    //                   //     //   if (element.name.toString().contains(text)) {
    //                   //     //     print(element.name);
    //                   //     //     // bloc.searchList.add(element);
    //                   //     //     bloc.updateSearchList(element);
    //                   //     //   }
    //                   //     // }
    //                   //     bloc.updateSearchList(text);
    //                   //   }
    //                   // },
    //                   ),
    //             ),
    //                         // return Container(
    //                         //   width: 200,
    //                         //   height: generalHeight,
    //                         //   padding: const EdgeInsets.all(15),
    //                         //   margin: const EdgeInsets.all(10),
    //                         //   decoration: BoxDecoration(
    //                         //     // color: Colors.amber,
    //                         //     borderRadius: BorderRadius.circular(20),
    //                         //     border: Border.all(
    //                         //       color: Colors.black12,
    //                         //       width: 2,
    //                         //     ),
    //                         //   ),
    //                         //   child: Column(
    //                         //     children: [
    //                         //       InkWell(
    //                         //         onTap: () {
    //                         //           Navigator.of(context).push(
    //                         //             MaterialPageRoute(
    //                         //               builder: (context) {
    //                         //                 return ProductScreen(
    //                         //                   item: bloc.searchList[index],
    //                         //                 );
    //                         //               },
    //                         //             ),
    //                         //           );
    //                         //         },
    //                         //         child: Image.asset(
    //                         //           // 'assets/images/Bananas.png',
    //                         //           bloc.searchList[index].image,
    //                         //           height: 75,
    //                         //         ),
    //                         //       ),
    //                         //       ListTile(
    //                         //         contentPadding: const EdgeInsets.all(0),
    //                         //         title: CustomText(
    //                         //           text: bloc.searchList[index].name,
    //                         //           // text: 'Organic Bananas ${index + 1}',
    //                         //           size: 16,
    //                         //           weight: FontWeight.bold,
    //                         //           color: Colors.black,
    //                         //         ),
    //                         //         subtitle: CustomText(
    //                         //           text: bloc.searchList[index].quantity,
    //                         //           size: 14,
    //                         //           weight: FontWeight.w500,
    //                         //           color: Colors.grey,
    //                         //         ),
    //                         //       ),
    //                         //       Row(
    //                         //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         //         children: [
    //                         //           CustomText(
    //                         //             text: '\$${bloc.searchList[index].price}',
    //                         //             size: 18,
    //                         //             weight: FontWeight.w600,
    //                         //             color: Colors.black,
    //                         //           ),
    //                         //           FloatingActionButton(
    //                         //             mini: true,
    //                         //             isExtended: true,
    //                         //             heroTag: null,
    //                         //             backgroundColor: bloc.greenColor,
    //                         //             shape: RoundedRectangleBorder(
    //                         //               borderRadius: BorderRadius.circular(10),
    //                         //             ),
    //                         //             child: const Icon(Icons.add),
    //                         //             onPressed: () {
    //                         //               bloc.addToCart(bloc.searchList[index]);
    //                         //               bloc.snackBar(
    //                         //                 context,
    //                         //                 'Item added to cart successfully',
    //                         //               );
    //                         //             },
    //                         //           ),
    //                         //         ],
    //                         //       )
    //                         //     ],
    //                         //   ),
    //                         // );
    //                       },
    //                     ),
    //                   )
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );


  // listener: (context, state) {
            //   debugPrint('Explore App bar');
            //   ExploreCubit.get(context).fromShopScreen();
            //   if (ExploreCubit.get(context).isFromShopScreen) {
            //     ExploreCubit.get(context).hideTitle();
            //   }
            //   // if (HomeCubit.get(context).onSearchTap) {
            //   //   ExploreCubit.get(context).hideTitle();
            //   //   debugPrint('True onSearchTap');
            //   // }
            //   // if (autofocus) {
            //   //   ExploreCubit.get(context).hideTitle();
            //   // }
            // },


              // debugPrint('Listener');
          // ExploreCubit.get(context).isFirstSearchState(searchController);
          // if(state is ExploreIsNotFirstSearchState)
          // {
          //   ExploreCubit.get(context).getSearchResults(text)
          // }

          // ExploreCubit.get(context).isFirstSearchState();
          // ExploreCubit.get(context)
          //     .onSearchChanged(searchController.text.isEmpty);
          // ExploreCubit.get(context).isEmptySearchField(
          //   searchController.text.isEmpty,
          // );
          // ExploreCubit.get(context).seachFieldView();
          // if (ExploreCubit.get(context).searchController.text.isNotEmpty) {
          //   ExploreCubit.get(context).getSearchResults();
          // }
          // ExploreCubit.get(context).seachFieldView();