import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math' as math;
import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../../../components/show_toast.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  int titleMaxLines = 1;
  int reviewIndex = -1;
  // int imageIndex = 0;

  itemCountIncrease(ProductModel product) {
    product.itemCount++;
    // upateProductQuantity(product);

    emit(ProductItemCountIncreaseState());
  }

  itemCountDecrease(ProductModel product) {
    if (product.itemCount > 1) {
      product.itemCount--;
      // upateProductQuantity(product);

      emit(ProductItemCountDecreaseState());
    }
  }

  reverseFavouriteButton(ProductModel product) {
    debugPrint('Fav before: ${product.isFavourite}');

    product.isFavourite = !product.isFavourite;
    debugPrint('Fav before: ${product.isFavourite}');

    AppNetworkServices.postData(
      data: {
        'product_id': product.id,
      },
      endPoint: favoritesEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      ShowToast.get(msg: value['message']);
      if (value['status']) {
        emit(ProductReverseFavouriteSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(ProductReverseFavouriteErrorState());
    });
  }

  double panelArrowTransform(bool isExpand) {
    double angel;
    if (isExpand) {
      // productPanel.panelTransformAngle = math.pi / 2;
      angel = math.pi / 2;
    } else {
      // productPanel.panelTransformAngle = 0;
      angel = 0;
    }

    emit(ExpandLabelTranstormationState());
    return angel;
  }

  updateReviewStars(int index, ProductModel product) {
    product.review = index;
    emit(ProductUpdateReviewStarsState());
  }

  addItemToCarts(ProductModel product) {
    AppNetworkServices.postData(
      data: {
        'product_id': product.id,
      },
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: cartsEndPoint,
    ).then((value) {
      ShowToast.get(msg: value['message']);
      if (value['status']) {
        product.inCart = true;
        emit(ProductToBasketSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(ProductToBasketErrorState());
    });
  }

  // changeImageIndex(int index, int length) {
  //   if (length < 6) {
  //     //5
  //     imageIndex = index;
  //   } else {
  //     if (index == length - 1) {
  //       imageIndex = 4;
  //     } else if (index < 4) {
  //       imageIndex = index % 4;
  //     } else {
  //       imageIndex = 3;
  //     }
  //   }

  //   emit(ProductChangeImageIndexState());
  // }

  // removeItemFromFavourites(ProductModel product) {
  //   AppNetworkServices.postData(
  //     data: {
  //       'product_id': product.id,
  //     },
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //     endPoint: favoritesEndPoint,
  //   ).then((value) {
  //     ShowToast.get(msg: value['message']);
  //     if (value['status']) {
  //       product.isFavourite = false;
  //       emit(ProductRemoveFavouriteSuccessState());
  //     }
  //   }).catchError((error) {
  //     debugPrint('Error: $error');
  //     emit(ProductRemoveFavouriteErrorState());
  //   });
  // }

  // addItemToFavourites(ProductModel product) {
  //   AppNetworkServices.postData(
  //     data: {
  //       'product_id': product.id,
  //     },
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //     endPoint: favoritesEndPoint,
  //   ).then((value) {
  //     ShowToast.get(msg: value['message']);
  //     if (value['status']) {
  //       product.isFavourite = true;
  //       emit(ProductAddFavouriteSuccessState());
  //     }
  //   }).catchError((error) {
  //     debugPrint('Error: $error');
  //     emit(ProductAddFavouriteErrorState());
  //   });
  // }

  // getFavouritesList() {
  //   myCartsList = [];
  //   emit(CartsGetCartsListLoadingState());
  //   AppNetworkServices.getData(
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //     endPoint: cartsEndPoint,
  //   ).then(
  //     (value) {
  //       cartStatus = value['status'];
  //       if (value['status']) {
  //         totalPrice = double.parse(value['data']['total'].toString());
  //         for (var element in value['data']['cart_items']) {
  //           myCartsList.add(CartsModel.fromJson(element));
  //         }
  //         emit(CartsGetCartsListSuccessState());
  //       }
  //     },
  //   ).catchError((error) {
  //     debugPrint('Error: $error');
  //     emit(CartsGetCartsListErrorState());
  //   });
  // }

}
