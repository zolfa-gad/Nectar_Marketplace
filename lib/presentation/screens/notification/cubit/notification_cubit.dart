import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../models/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitialState());

  static NotificationCubit get(context) => BlocProvider.of(context);

  List<NotifyModel> notifyList = [];

  getAccountNotify() {
    emit(NotificationLoadingState());
    AppNetworkServices.getData(
      endPoint: notificationsEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      debugPrint('Statu: ${value['status']}');

      if (value['status']) {
        for (var element in value['data']['data']) {
          notifyList.add(NotifyModel.fromJson(element));
        }
        emit(NotificationSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(NotificationErrorState());
    });
  }

  removeNotifyAt(int index) {
    notifyList.removeAt(index);
    emit(NotificationRemoveElementState());
  }
}
