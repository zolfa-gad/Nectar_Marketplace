import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';
import '../models/help_model.dart';

class HelpInfoItem extends StatelessWidget {
  const HelpInfoItem({
    Key? key,
    required this.helpItem,
  }) : super(key: key);

  final HelpModel helpItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 15,
      ),
      title: DefaultText(
        text: helpItem.question,
        size: 20,
        weight: FontWeight.bold,
        align: TextAlign.left,
        maxLines: 2,
      ),
      subtitle: DefaultText(
        padding: const EdgeInsets.only(left: 5),
        text: helpItem.answer,
        size: 18,
        weight: FontWeight.w500,
        align: TextAlign.left,
        maxLines: 5,
      ),
    );
  }
}
