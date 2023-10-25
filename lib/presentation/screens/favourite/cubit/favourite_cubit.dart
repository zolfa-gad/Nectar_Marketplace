import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../../../components/show_toast.dart';
import '../../product/cubit/product_cubit.dart';
import '../models/favourite_model.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitialState());

  static FavouriteCubit get(context) => BlocProvider.of(context);

  List<FavouriteModel> myFavouritesList = [];
  List<ProductModel> favProductList = [];
  bool favStatus = false;
  ProductModel? productModelItem;

  // removeItemFromCarts(ProductModel product) {
  //   AppNetworkServices.postData(
  //     data: {
  //       'product_id': product.id,
  //     },
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //     endPoint: cartsEndPoint,
  //   ).then((value) {
  //     ShowToast.get(msg: value['message']);
  //     if (value['status']) {
  //       product.inCart = false;
  //       getMyCartsList();
  //       emit(CartsRemoveProductSuccessState());
  //     }
  //   }).catchError((error) {
  //     debugPrint('Error: $error');
  //     emit(CartsRemoveProductErrorState());
  //   });
  // }

  getFavouritesList() {
    myFavouritesList = [];
    emit(FavouriteGetListLoadingState());
    AppNetworkServices.getData(
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: favoritesEndPoint,
    ).then(
      (value) {
        favStatus = value['status'];
        if (value['status']) {
          for (var item in value['data']['data']) {
            myFavouritesList.add(FavouriteModel.fromJson(item));
            getProductById(item['product']['id']);
          }
          emit(FavouriteGetListSuccessState());
        }
      },
    ).catchError((error) {
      debugPrint('Error: $error');
      emit(FavouriteGetListErrorState());
    });
  }

  getProductById(int productId) {
    AppNetworkServices.getData(
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: '$productsEndPoint/$productId',
    ).then(
      (value) {
        debugPrint('Product Status: ${value['status']}');
        if (value['status']) {
          ProductModel product = ProductModel.fromJson(value['data']);
          // productModelItem = ProductModel.fromJson(value['data']);
          favProductList.add(
            product,
          );
          emit(ProductGetByIdSuccessState());
        }
      },
    ).catchError((error) {
      debugPrint('Error: $error');
      emit(ProductGetByIdErrorState());
    });
  }

  addAllFavouriteToCart(context) {
    bool isCount = false;
    for (var element in favProductList) {
      if (!element.inCart) {
        isCount = true;
        ProductCubit.get(context).addItemToCarts(element);
      }
    }
    if (!isCount) {
      ShowToast.get(msg: 'Items are already in the cart');
    }
    emit(FavouriteToCartSuccessState());
  }
}
