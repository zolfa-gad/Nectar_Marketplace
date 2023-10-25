import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../models/register_model.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData visibilityIcon = Icons.visibility_off_outlined;
  bool isObscure = true;
  RegisterModel? registerModel;

  String countryCode = '+20';

  changeVisibilityIcon() {
    isObscure = !isObscure;

    visibilityIcon =
        isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangeVisibilityState());
  }

  onCountryCodeChange(String code) {
    countryCode = code;
    emit(RegisterCountryCodeChangeState());
  }

  userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    debugPrint('Phone: ${random().toString()}');
    AppNetworkServices.postData(
      data: {
        'name': name,
        'email': email,
        'password': password,
        // 'phone': random().toString(),
        'phone': phone.isEmpty ? '' : countryCode + phone,
      },
      endPoint: registerEndPoint,
    ).then((value) {
      debugPrint('Value: ${value.toString()}');

      registerModel = RegisterModel.fromJson(value);
      emit(RegisterSuccesState(registerModel!));

      if (registerModel!.status) {
        debugPrint('status is true moving to home screen and saving token');

        AppLocalServices.saveLocalData(
          tokenPrefs,
          registerModel!.userData!.token,
        );
        debugPrint('Token: ${AppLocalServices.getLocalData(tokenPrefs)}');
      } else {
        // delete token
        AppLocalServices.deleteLocalData('token');
      }
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(RegisterErrorState());
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
