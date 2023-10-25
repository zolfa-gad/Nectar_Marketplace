import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';

import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitialState());

  static ExploreCubit get(context) => BlocProvider.of(context);

  List<ProductModel> searchResultList = [];
  List<ProductModel> sortedSearchResultList = [];
  List<ProductModel> startWithXList = [];
  List<ProductModel> containsXList = [];

  final TextEditingController searchController = TextEditingController();

  bool isEmptySearch = false;
  bool isFirstSearch = true;
  bool isVisibleTitle = true;
  // bool isFromShopScreen = false;

  // bool isEmptySearch = true;

  // seachFieldView() {
  //   if (searchController.text.isEmpty) {
  //     emit(ExploreSearchFieldChangedState());
  //   } else {
  //     isFirstSearch = false;
  //   }
  //   // isEmptySearch = searchController.text.isEmpty;
  // }
  isFirstSearchState({required bool value}) {
    isFirstSearch = value;
    // isVisibleTitle = false;
    if (value) {
      emit(ExploreIsFirstSearchState());
    } else {
      emit(ExploreIsNotFirstSearchState());
    }
    // isEmptySearch = false;
    // if (value) {
    //   emit(ExploreIsFirstSearchState());
    // } else {
    //   emit(ExploreIsNotFirstSearchState());
    // }
  }

  hideTitle() {
    isVisibleTitle = false;
    debugPrint('statement: Hiding');
    // isFromShopScreen = false;
    emit(ExploreIsNotFirstSearchState());
  }

  // fromShopScreen() {
  //   isFromShopScreen = true;
  //   emit(ExploreIsNotFirstSearchState());
  //   // hideTitle();
  // }

  // sortSearchList() {
  //   isEmptySearch = false;
  //   isFirstSearch = false;
  //   // sortedSearchResultList.clear();
  //   // List<ProductModel> myList = [];
  //   // searchResultList.sort(
  //   //   (first, second) {
  //   //     return first.name.toString().toLowerCase().compareTo(
  //   //           second.name.toString().toLowerCase(),
  //   //         );
  //   //   },
  //   // );
  //   for (var element in searchResultList) {
  //     if (element.name.toLowerCase().startsWith(
  //           searchController.text.toLowerCase(),
  //         )) {
  //       // myList.add(element);
  //       startWithXList.add(element);
  //       debugPrint('Start: ${startWithXList.length}');
  //       // searchResultList.remove(element);
  //       debugPrint('Search: ${searchResultList.length}');
  //     } else if (element.name.toLowerCase().contains(
  //           searchController.text.toLowerCase(),
  //         )) {
  //       containsXList.add(element);
  //       debugPrint('Contain: ${containsXList.length}');
  //       // searchResultList.remove(element);
  //       debugPrint('Search: ${searchResultList.length}');
  //     }
  //   }
  //   startWithXList.sort(
  //     (first, second) {
  //       return first.name.toString().toLowerCase().compareTo(
  //             second.name.toString().toLowerCase(),
  //           );
  //     },
  //   );
  //   containsXList.sort(
  //     (first, second) {
  //       return first.name.toString().toLowerCase().compareTo(
  //             second.name.toString().toLowerCase(),
  //           );
  //     },
  //   );
  //   // for (var element in myList) {
  //   //   sortedSearchResultList.add(element);
  //   // }
  //   // for (var element in searchResultList) {
  //   //   sortedSearchResultList.add(element);
  //   // }
  //   emit(ExploreSearchResultSuccessState());
  //   // List<ProductModel> start = searchResultList
  //   //     .where(
  //   //       (element) => element.name.toLowerCase().startsWith(
  //   //             searchController.text.toLowerCase(),
  //   //           ),
  //   //     )
  //   //     .toList();
  //   // List<ProductModel> contain = searchResultList
  //   //     .where(
  //   //       (element) => element.name.toLowerCase().contains(
  //   //             searchController.text.toLowerCase(),
  //   //             searchController.text.length,
  //   //           ),
  //   //     )
  //   //     .toList();
  //   // for (var element in start) {
  //   //   debugPrint('start: ${element.name}');
  //   // }
  //   // for (var element in contain) {
  //   //   debugPrint('contain: ${element.name}');
  //   // }
  // }

  getAllProducts(List<ProductModel> products) {
    searchResultList = products;
    debugPrint('Search: ${searchResultList.length}');

    emit(ExploreSearchResultSuccessState());
  }

  getFilteredList(String text) {
    emit(ExploreSearchResultLoadingState());
    startWithXList.clear();
    containsXList.clear();
    sortedSearchResultList.clear();

    if (text.length == 1) {
      getStartWithXList(text);
      if (startWithXList.isEmpty) {
        getContainsXList(text);
        sortedSearchResultList = containsXList;
      } else {
        sortedSearchResultList = startWithXList;
      }
    } else {
      getStartWithXList(text);
      getContainsXList(text);
      sortedSearchResultList = startWithXList + containsXList;
      debugPrint('Sorted: ${sortedSearchResultList.length}');
    }
    emit(ExploreSearchResultSuccessState());

    // if (text.length == 1) {
    //   sortedSearchResultList = searchResultList
    //       .where(
    //         (element) => element.name.toLowerCase().contains(
    //               text.toLowerCase(),
    //             ),
    //       )
    //       .toList();
    //   debugPrint('result: ${sortedSearchResultList.length}');
    //   sortedSearchResultList.sort(
    //     (first, second) {
    //       return first.name.toString().toLowerCase().compareTo(
    //             second.name.toString().toLowerCase(),
    //           );
    //     },
    //   );
    // } else {
    // }

    if (startWithXList.isEmpty &&
        containsXList.isEmpty &&
        sortedSearchResultList.isEmpty) {
      isEmptySearch = true;
      emit(ExploreIsEmptySearchState());
    } else {
      isEmptySearch = false;
      emit(ExploreIsNotEmptySearchState());
    }
  }

  getStartWithXList(String text) {
    startWithXList = searchResultList
        .where(
          (element) => element.name.toLowerCase().startsWith(
                text.toLowerCase(),
              ),
        )
        .toList();

    debugPrint('Start: ${startWithXList.length}');
    startWithXList = sortList(startWithXList);
  }

  getContainsXList(String text) {
    containsXList = searchResultList
        .where(
          (element) => element.name.substring(0, 10).toLowerCase().contains(
                text.toLowerCase(),
                text.length + 1,
              ),
        )
        .toList();

    debugPrint('Contain: ${startWithXList.length}');
    containsXList = sortList(containsXList);
  }

  sortList(List<ProductModel> list) {
    list.sort(
      (first, second) {
        return first.name.toString().toLowerCase().compareTo(
              second.name.toString().toLowerCase(),
            );
      },
    );
    return list;
  }

  // getSearchResults(String text) {
  //   searchResultList.clear();
  //   startWithXList.clear();
  //   containsXList.clear();
  //   emit(ExploreSearchResultLoadingState());
  //   AppNetworkServices.postData(
  //     data: {
  //       'text': text,
  //     },
  //     endPoint: '$productsEndPoint/search',
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //   ).then((value) {
  //     debugPrint('Search Status: ${value['status']}');
  //     if (value['status'] && value['data']['data'].isNotEmpty) {
  //       for (var element in value['data']['data']) {
  //         searchResultList.add(
  //           ProductModel.fromJson(element),
  //         );
  //       }
  //       getFilteredList(text);
  //       // sortSearchList();
  //       emit(ExploreSearchResultSuccessState());
  //     }
  //   }).catchError((error) {
  //     debugPrint('Error: $error');
  //     emit(ExploreSearchResultErrorState());
  //   });
  // }
}
