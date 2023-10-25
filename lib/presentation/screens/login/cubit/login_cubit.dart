import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../location/models/address_model.dart';
import '../models/login_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitialState());

  static LogInCubit get(context) => BlocProvider.of(context);

  IconData visibilityIcon = Icons.visibility_off_outlined;
  bool isObscure = true;
  LogInModel? loginModel;
  // late AddressDataModel addressModel;

  AddressDataModel? addressModel;
  // = AddressDataModel(
  //   id: 0,
  //   name: '',
  //   city: '',
  //   region: '',
  //   details: '',
  //   notes: '',
  //   latitude: 0,
  //   longitude: 0,
  // );

  changeVisibilityIcon() {
    isObscure = !isObscure;

    visibilityIcon =
        isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(LogInChangeVisibilityState());
  }

  userLogIn({required String email, required String password}) {
    AppNetworkServices.postData(
      data: {
        'email': email,
        'password': password,
      },
      endPoint: logInEndPoint,
    ).then((value) {
      // Map<String, dynamic> result = value.data;
      debugPrint('Value: ${value.toString()}');

      loginModel = LogInModel.fromJson(value);
      emit(LogInSuccesState(loginModel!));

      if (loginModel!.status) {
        debugPrint('status is true moving to home screen and saving token');
        // Navigator.pushReplacementNamed(context, homeScreen);

        AppLocalServices.saveLocalData(
          tokenPrefs,
          loginModel!.userData!.token,
        );
        debugPrint('Token: ${AppLocalServices.getLocalData(tokenPrefs)}');
      } else {
        // delete token
        AppLocalServices.deleteLocalData(tokenPrefs);
      }
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(LogInErrorState());
      },
    );
  }

  getAddress() {
    emit(LogInAddressLoadingState());
    AppNetworkServices.getData(
      endPoint: addressEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      if (value['status']) {
        List addressList = value['data']['data'];

        if (addressList.isEmpty) {
          addressModel = null;
          AppLocalServices.deleteLocalData(addressPrefs);
          debugPrint('statement: Address null');
        } else {
          addressModel = AddressDataModel.fromJson(
            // one element
            addressList[0],
          );
          AppLocalServices.saveLocalData(
            addressPrefs,
            '${addressList[0]['city']}, ${addressList[0]['region']}',
          );
        }

        debugPrint('Address: $addressList');
      }
      emit(LogInAddressSuccessState());
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(LogInAddressErrorState());
      },
    );
  }
  // getUserProfile(context) {
  //   debugPrint('tokn: ${AppLocalServices.getLocalData('token')}');
  //   AppNetworkServices.getData(
  //     endPoint: profileEndPoint,
  //     token: AppLocalServices.getLocalData('token'),
  //   ).then((value) {
  //     // Map<String, dynamic> result = value.data;
  //     debugPrint('Value: ${value.toString()}');
  //     debugPrint('ncmnc: ${value.data}');

  //     if (value.data['status']) {
  //       emit(LogInProfileSuccesState());
  //     } else {
  //       emit(LogInProfileNotFoundState());
  //     }
  //     return value.data['status'];
  //     // return value.data;

  //     // if(value.data.status)

  //     // if (loginModel.data != null) {
  //     //   AppLocalServices.saveLocalData(
  //     //     'token',
  //     //     loginModel.data!.token,
  //     //   );

  //     // }
  //   }).catchError(
  //     (error) {
  //       debugPrint('Error: ${error.toString()}');
  //       emit(LogInErrorState());
  //     },
  //   );
  // }

  // userKeepAlive() {
  //   if (userInitializd) {
  //     userLogIn(
  //       email: user!.email,
  //       password: user!.password,
  //     );
  //     print('sucss');
  //   }
  // }

  // userRegister({
  //   required String email,
  //   required String password,
  //   required String name,
  // }) {
  //   String phone = random().toString();
  //   AppServices.postData(
  //     data: {
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'phone': phone,
  //     },
  //     endPoint: registerEndPoint,
  //   ).then((value) {
  //     Map<String, dynamic> result = value.data;
  //     registerToken = result['data']['token'].toString();
  //     debugPrint('registerToken: $registerToken');
  //     resultMessage = result['message'].toString();
  //     registerID = result['data']['id'].toString();
  //     debugPrint('resultMessage: $resultMessage');
  //     debugPrint('registerID: $registerID');
  //     debugPrint('result: $result');
  //     // user = UserModel(
  //     //   email: email,
  //     //   password: password,
  //     //   name: name,
  //     //   tokenAuth: registerToken,
  //     //   userID: registerID,
  //     //   phone: phone,
  //     // );
  //     userInitializd = true;
  //     emit(LogInSuccesState());
  //   }).catchError(
  //     (error) {
  //       debugPrint(error.toString());
  //       emit(LogInErrorState());
  //     },
  //   );
  // }

  int random() {
    int min = 1000000000;
    int max = 4294967296;
    return min + Random().nextInt(max - min);
  }

  var mySnackBar = const SnackBar(
    content: Text('data'),
  );

  snackBar(context, text) {
    mySnackBar = SnackBar(
      // content: const Text('Item removed successfully'),
      content: Text(text),
      backgroundColor: Colors.black87,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );
    // snackText = text;
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
  }
}
