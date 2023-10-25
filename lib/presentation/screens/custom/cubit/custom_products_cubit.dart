import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import 'custom_products_state.dart';

class CustomProductsCubit extends Cubit<CustomProductsState> {
  CustomProductsCubit() : super(CustomProductsInitialState());

  static CustomProductsCubit get(context) => BlocProvider.of(context);

  final List<ProductModel> productsList = [];

  getProductsCategory(int id) {
    emit(CustomProductsLoadingState());
    AppNetworkServices.getData(
      query: {
        'category_id': id,
      },
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: productsEndPoint,
    ).then((value) {
      debugPrint('status: ${value['status']}');
      if (value['status']) {
        for (var element in value['data']['data']) {
          productsList.add(ProductModel.fromJson(element));
        }
        emit(CustomProductsSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(CustomProductsErrorState());
    });
  }
}
