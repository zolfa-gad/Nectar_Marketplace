import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/titles.dart';
import 'see_all_state.dart';

class SeeAllCubit extends Cubit<SeeAllState> {
  SeeAllCubit() : super(SeeAllInitialState());

  static SeeAllCubit get(context) => BlocProvider.of(context);

  // final List<ProductModel> productsList = [];

  getProductsCategory(String title) {
    if (title == bestSellingTitle) {
      debugPrint(bestSellingTitle);
    } else if (title == exclusiveOfferTitle) {
      debugPrint(exclusiveOfferTitle);
    }
    // emit(CustomProductsLoadingState());
    // AppNetworkServices.getData(
    //   query: {
    //     'category_id': id,
    //   },
    //   token: AppLocalServices.getLocalData(tokenPrefs),
    //   endPoint: productsEndPoint,
    // ).then((value) {
    //   debugPrint('status: ${value['status']}');
    //   if (value['status']) {
    //     for (var element in value['data']['data']) {
    //       productsList.add(ProductModel.fromJson(element));
    //     }
    //     emit(CustomProductsSuccessState());
    //   }
    // }).catchError((error) {
    //   debugPrint('Error: $error');
    //   emit(CustomProductsErrorState());
    // });
  }
}
