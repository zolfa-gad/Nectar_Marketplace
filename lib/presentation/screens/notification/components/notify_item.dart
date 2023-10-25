import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';
import '../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notifyItem,
  }) : super(key: key);

  final NotifyModel notifyItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: DefaultText(
        text: notifyItem.title,
        size: 20,
        weight: FontWeight.bold,
        align: TextAlign.left,
      ),
      subtitle: DefaultText(
        padding: const EdgeInsets.only(left: 5),
        text: notifyItem.message,
        size: 18,
        maxLines: 2,
        weight: FontWeight.w500,
        align: TextAlign.left,
      ),
    );
  }
}
