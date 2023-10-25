import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/icons.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../../login/models/login_model.dart';
import '../models/info_model.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitialState());

  static AccountCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();

  LogInModel? loginModel;
  // bool readOnly = true;
  IconData editIcon = Icons.edit_outlined;
  double editIconSize = 18;
  bool isEditingName = false;

  final List<InformationModel> accountInfoList = [
    InformationModel(
      name: 'Orders',
      icon: ordersSvgIcon,
      index: 0,
      isEnabled: false,
    ),
    InformationModel(
      name: 'My Details',
      icon: detailsSvgIcon,
      index: 1,
      isEnabled: false,
    ),
    InformationModel(
      name: 'Delivery Address',
      icon: deliveryAddSvgIcon,
      index: 2,
      isEnabled: false,
    ),
    InformationModel(
      name: 'Payment Methods',
      icon: paymentSvgIcon,
      index: 3,
      isEnabled: false,
    ),
    InformationModel(
      name: 'Promo Code',
      icon: promoCardSvgIcon,
      index: 4,
      isEnabled: false,
    ),
    InformationModel(
      name: 'Notifications',
      icon: notificationSvgIcon,
      index: 5,
      isEnabled: true,
    ),
    InformationModel(
      name: 'Help',
      icon: helpSvgIcon,
      index: 6,
      isEnabled: true,
    ),
    InformationModel(
      name: 'About',
      icon: aboutSvgIcon,
      index: 7,
      isEnabled: true,
    ),
  ];

  getProfilData() {
    emit(GetAccountDataLoadingState());
    AppNetworkServices.getData(
      endPoint: profileEndPoint,
      token: AppLocalServices.getLocalData('token'),
    ).then((value) {
      // Map<String, dynamic> result = value.data;
      debugPrint('Value: ${value.toString()}');

      loginModel = LogInModel.fromJson(value);
      usernameController.text = loginModel!.userData!.name;
      emit(GetAccountDataSuccesState(loginModel!));

      if (loginModel!.status) {
        debugPrint('status is true moving to home screen and saving token');
        // Navigator.pushReplacementNamed(context, homeScreen);

        // AppLocalServices.saveLocalData(
        //   tokenPrefs,
        //   loginModel.userData!.token,
        // );
        debugPrint('Token: ${AppLocalServices.getLocalData(tokenPrefs)}');
      }
      //  else {
      //   // delete token
      //   AppLocalServices.deleteLocalData('token');
      // }
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(GetAccountDataErrorState());
      },
    );
  }

  updateProfileData() {
    emit(AccountUpdateDataLoadingState());
    debugPrint('name : ${usernameController.text}');
    debugPrint('email: ${loginModel!.userData!.email}');
    debugPrint('phone: ${loginModel!.userData!.phone}');

    AppNetworkServices.updateData(
      data: {
        'name': usernameController.text,
        'email': loginModel!.userData!.email,
        'phone': loginModel!.userData!.phone,
      },
      token: AppLocalServices.getLocalData(tokenPrefs),
      endPoint: updateProfileEndPoint,
    ).then((value) {
      debugPrint('statement: $value');
      loginModel = LogInModel.fromJson(value);
      // if(value['status'])
      // {

      // }
      emit(AccountUpdateDataSuccessState());
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(AccountUpdateDataErrorState());
    });
  }

  // updateProfileData() {
  //   AppNetworkServices.postData(
  //     data: {
  //       'name': usernameController.text,
  //       'email': loginModel!.userData!.email,
  //       // 'password': password,
  //       'phone': loginModel!.userData!.phone,
  //     },
  //     endPoint: profileEndPoint,
  //   ).then((value) {
  //     // Map<String, dynamic> result = value.data;
  //     debugPrint('Value: ${value.toString()}');
  //     registerModel = RegisterModel.fromJson(value);
  //     emit(RegisterSuccesState(registerModel!));
  //     if (registerModel!.status) {
  //       debugPrint('status is true moving to home screen and saving token');
  //       // Navigator.pushReplacementNamed(context, homeScreen);
  //       // Navigator.pushNamed(context, homeScreen);
  //       // AppLocalServices.saveLocalData(
  //       //   'email',
  //       //   email,
  //       // );
  //       // AppLocalServices.saveLocalData(
  //       //   'password',
  //       //   password,
  //       // );
  //       AppLocalServices.saveLocalData(
  //         tokenPrefs,
  //         registerModel!.userData!.token,
  //       );
  //       debugPrint('Token: ${AppLocalServices.getLocalData(tokenPrefs)}');
  //     } else {
  //       // delete token
  //       AppLocalServices.deleteLocalData('token');
  //     }
  //     // if (loginModel.data != null) {
  //     //   AppLocalServices.saveLocalData(
  //     //     'token',
  //     //     loginModel.data!.token,
  //     //   );
  //     // }
  //   }).catchError(
  //     (error) {
  //       debugPrint('Error: ${error.toString()}');
  //       emit(RegisterErrorState());
  //     },
  //   );
  // }

  editAccountName() {
    isEditingName = !isEditingName;
    if (isEditingName) {
      editIcon = Icons.check;
      editIconSize = 25;
      emit(AccountNameEditState());
    } else {
      editIcon = Icons.edit_outlined;
      editIconSize = 18;
      emit(AccountUpdateDataState());
    }
    debugPrint('statement: ${usernameController.text}');
  }
}
