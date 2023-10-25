import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/icon_button.dart';
import '../../../components/text_widget.dart';
import '../../about/about_screen.dart';
import '../../help/help_screen.dart';
import '../../notification/notification_screen.dart';
import '../models/info_model.dart';

class InfoListItem extends StatelessWidget {
  const InfoListItem({
    Key? key,
    required this.infoItem,
  }) : super(key: key);

  final InformationModel infoItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      // tileColor: infoItem.isEnabled ? Colors.transparent : Colors.grey[200],
      title: DefaultText(
        text: infoItem.name,
        size: 18,
        weight: FontWeight.w600,
        color: infoItem.isEnabled ? Colors.black : Colors.black54,
        align: TextAlign.left,
      ),
      leading: SvgPicture.asset(
        infoItem.icon,
        color: infoItem.isEnabled ? Colors.black : Colors.black54,
      ),
      trailing: DefaultIconButton(
        icon: Icons.arrow_forward_ios,
        onPressed: () {},
        size: 20,
        color: infoItem.isEnabled ? Colors.black : Colors.black54,
      ),
      onTap: infoItem.isEnabled
          ? () {
              switch (infoItem.index) {
                case 5:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationScreen();
                      },
                    ),
                  );
                  break;
                case 6:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HelpScreen();
                      },
                    ),
                  );
                  break;
                case 7:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutScreen();
                      },
                    ),
                  );
                  break;
              }
            }
          : null,
    );
  }
}
