import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';
import '../cubit/about_cubit.dart';

class AboutInfoItem extends StatelessWidget {
  const AboutInfoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
          isThreeLine: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 15,
          ),
          title: DefaultText(
            text: index == 0 ? 'About Us' : 'Terms And Conditions',
            size: 20,
            weight: FontWeight.bold,
            align: TextAlign.left,
            maxLines: 2,
          ),
          subtitle: DefaultText(
            padding: const EdgeInsets.only(left: 5, top: 5),
            text: index == 0
                ? AboutCubit.get(context).aboutItem
                : AboutCubit.get(context).termsItem,
            size: 18,
            weight: FontWeight.w500,
            align: TextAlign.left,
            maxLines: 15,
          ),
        );
      },
    );
  }
}
