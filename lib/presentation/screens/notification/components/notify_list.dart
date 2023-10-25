import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../cubit/notification_cubit.dart';
import '../cubit/notification_state.dart';
import 'notify_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: NotificationCubit.get(context).notifyList.length,
          itemBuilder: (context, index) {
            String key =
                NotificationCubit.get(context).notifyList[index].id.toString();
            return Dismissible(
              key: Key(key),
              background: Container(color: greyColor),
              onDismissed: (direction) {
                NotificationCubit.get(context).removeNotifyAt(index);
                if (NotificationCubit.get(context).notifyList.isEmpty) {
                  Navigator.of(context).pop();
                }
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('$item dismissed'),
                //   ),
                // );
              },
              child: NotificationItem(
                notifyItem: NotificationCubit.get(context).notifyList[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: greyColor,
              height: 3,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            );
          },
        );
      },
    );
  }
}
