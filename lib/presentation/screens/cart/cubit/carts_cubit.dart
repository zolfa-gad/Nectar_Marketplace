import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../../../components/show_toast.dart';
import '../models/carts_model.dart';
import 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit() : super(CartsInitialState());

  static CartsCubit get(context) => BlocProvider.of(context);

  List<CartsModel> myCartsList = [];
  bool cartStatus = false;

  double totalPrice = 0;

  bool isEnabledButton = true;

  quantityIncrease(CartsModel product) {
    product.quantity++;
    upateProductQuantity(product);

    emit(CartsProductIncreaseQuantityState());
  }

  quantityDecrease(CartsModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      upateProductQuantity(product);

      emit(CartsProductDecreaseQuantityState());
    }
  }

  upateProductQuantity(CartsModel cartItem) {
    AppNetworkServices.updateData(
      data: {
        'quantity': cartItem.quantity,
      },
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: '$cartsEndPoint/${cartItem.id}',
    ).then((value) {
      if (value['status']) {
        debugPrint('Total: ${value['data']['total']}');
        totalPrice = double.parse(value['data']['total'].toString());
        ShowToast.get(
          msg: value['message'],
        );
      }

      emit(CartsSuccessUpdateQuantityState());
    }).catchError((error) {
      debugPrint('Error: $error');
    });
    emit(CartsErrorUpdateQuantityState());
  }

  removeItemFromCarts(ProductModel product) {
    AppNetworkServices.postData(
      data: {
        'product_id': product.id,
      },
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: cartsEndPoint,
    ).then((value) {
      ShowToast.get(msg: value['message']);
      if (value['status']) {
        product.inCart = false;
        getMyCartsList();

        emit(CartsRemoveProductSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(CartsRemoveProductErrorState());
    });
  }

  getMyCartsList() {
    myCartsList.clear();
    emit(CartsGetCartsListLoadingState());
    AppNetworkServices.getData(
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: cartsEndPoint,
    ).then(
      (value) {
        cartStatus = value['status'];
        if (value['status']) {
          totalPrice = double.parse(value['data']['total'].toString());
          for (var element in value['data']['cart_items']) {
            myCartsList.add(CartsModel.fromJson(element));
          }
          debugPrint('cart length: ${myCartsList.length}');

          emit(CartsGetCartsListSuccessState());
          if (myCartsList.isEmpty) {
            isEnabledButton = false;
            emit(CartsNotEnabledButtonState());
          } else {
            isEnabledButton = true;
            emit(CartsEnabledButtonState());
          }
        }
      },
    ).catchError((error) {
      debugPrint('Error: $error');
      emit(CartsGetCartsListErrorState());
    });
  }

  String? radioListValue;
  int payMethod = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  onRadioListChange(value) {
    debugPrint('statement: $value');
    radioListValue = value;
    if (value == 'CASH') {
      payMethod = 1;
    } else if (value == 'VISA') {
      payMethod = 2;
    }
    debugPrint('payment: $payMethod');

    // payMethod = radioListValue!;
    emit(RadioListChangedState());
  }

  placeNewOrder() {
    debugPrint('radio value: $radioListValue');
    debugPrint('paymentMethod: $payMethod');

    emit(PlaceOrderLoadingState());
    AppNetworkServices.postData(
      data: {
        // 'address_id': AppLocalServices.getLocalData(addressIDPrefs) ?? 35,
        'address_id': 35,
        'payment_method': payMethod,
        'use_points': false,
      },
      endPoint: ordersEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      debugPrint('Order Status: ${value['status']}');
      if (value['status']) {
        cartStatus = false;
        // getMyCartsList();

        emit(PlaceOrderSuccessState());
        getMyCartsList();
        
      } else {
        ShowToast.get(msg: value['message']);
        // emit(PlaceOrderErrorState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(PlaceOrderErrorState());
    });
  }
}
