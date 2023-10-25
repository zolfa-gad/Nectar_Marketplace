import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../cubit/help_cubit.dart';
import 'help_item.dart';

class HelpInfoList extends StatelessWidget {
  const HelpInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: HelpCubit.get(context).helpList.length,
      itemBuilder: (context, index) {
        return HelpInfoItem(
          helpItem: HelpCubit.get(context).helpList[index],
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
  }
}
