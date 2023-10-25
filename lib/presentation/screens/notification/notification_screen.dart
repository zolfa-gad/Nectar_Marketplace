import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../../components/icon_button.dart';
import '../../components/show_toast.dart';
import 'components/notify_list.dart';
import 'cubit/notification_cubit.dart';
import 'cubit/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getAccountNotify(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is NotificationSuccessState) {
            ShowToast.get(
              msg: 'Swipe right or left to dismiss the notification.',
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(
                double.infinity,
                appBarHeight,
              ),
              child: SafeArea(
                child: DefaultAppBar(
                  titleText: notificationBarTitle,
                  leadingIcon: DefaultIconButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            body: Center(
              child: state is NotificationLoadingState
                  ? const CircularProgressIndicator()
                  : const NotificationsList(),
              // : Container(
              //     width: 100,
              //     height: 100,
              //     color: Colors.amber,
              //   ),
            ),
          );
        },
      ),
    );
  }
}
