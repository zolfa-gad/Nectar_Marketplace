import '../../../../data/constants/end_points.dart';
import '../../../../data/services/network_sevices.dart';
import 'about_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitialState());

  static AboutCubit get(context) => BlocProvider.of(context);
  late String aboutItem;
  late String termsItem;

  getAboutInfo() {
    emit(AboutLoadingState());
    AppNetworkServices.getData(
      endPoint: aboutEndPoint,
    ).then((value) {
      debugPrint('Status: ${value['status']}');
      if (value['status']) {
        aboutItem = value['data']['about'];
        termsItem = value['data']['terms'];
        // for (var element in value['data']['data']) {
        //   helpList.add(HelpModel.fromJson(element));
        // }
        emit(AboutSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(AboutErrorState());
    });
  }
}


// class AboutCubit extends Cubit<AboutState> {
//   AboutCubit() : super(AboutInitialState());

//   static AboutCubit get(context) => BlocProvider.of(context);



  
// }
