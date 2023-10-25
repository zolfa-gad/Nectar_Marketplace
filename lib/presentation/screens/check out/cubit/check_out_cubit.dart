// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../data/constants/end_points.dart';
// import '../../../../data/constants/prefs.dart';
// import '../../../../data/services/local_sevices.dart';
// import '../../../../data/services/network_sevices.dart';
// import '../../../components/show_toast.dart';
// import 'check_out_state.dart';

// class CheckOutCubit extends Cubit<CheckOutState> {
//   CheckOutCubit() : super(CheckOutInitialState());

//   static CheckOutCubit get(context) => BlocProvider.of(context);

//   String? radioListValue;
//   int payMethod = 0;

//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();

//   onRadioListChange(value) {
//     debugPrint('statement: $value');
//     radioListValue = value;
//     if (value == 'CASH') {
//       payMethod = 1;
//     } else if (value == 'VISA') {
//       payMethod = 2;
//     }
//     debugPrint('payment: $payMethod');

//     // payMethod = radioListValue!;
//     emit(RadioListChangedState());
//   }

//   placeNewOrder() {
//     debugPrint('radio value: $radioListValue');
//     debugPrint('paymentMethod: $payMethod');

//     emit(PlaceOrderLoadingState());
//     AppNetworkServices.postData(
//       data: {
//         'address_id': 35,
//         'payment_method': payMethod,
//         'use_points': false,
//       },
//       endPoint: ordersEndPoint,
//       token: AppLocalServices.getLocalData(tokenPrefs),
//     ).then((value) {
//       debugPrint('Order Status: ${value['status']}');
//       if (value['status']) {
//         emit(PlaceOrderSuccessState());
//       } else {
//         ShowToast.get(msg: value['message']);
//         // emit(PlaceOrderErrorState());
//       }
//     }).catchError((error) {
//       debugPrint('Error: $error');
//       emit(PlaceOrderErrorState());
//     });
//   }
// }
