import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/services/network_sevices.dart';
import '../models/help_model.dart';
import 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitialState());

  static HelpCubit get(context) => BlocProvider.of(context);

  List<HelpModel> helpList = [];

  getHelpInfo() {
    emit(HelpLoadingState());
    AppNetworkServices.getData(
      endPoint: helpEndPoint,
    ).then((value) {
      debugPrint('Status: ${value['status']}');
      if (value['status']) {
        for (var element in value['data']['data']) {
          helpList.add(HelpModel.fromJson(element));
        }
        emit(HelpSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(HelpErrorState());
    });
  }
}
