import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/constants/colors.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/constants/screens.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../components/orange_button.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultOrangeButton(
      text: logOutButton,
      color: greyColor,
      leadingIcon: Icons.logout,
      onPressed: () {
        AppLocalServices.deleteLocalData(tokenPrefs);
        AppLocalServices.deleteLocalData(addressPrefs);
        // temporary
        // AppLocalServices.deleteLocalData(boardingPrefs);
        Navigator.of(context).pushReplacementNamed(
          logInScreen,
        );
      },
    );

    //  ElevatedButton.icon(
    //   onPressed: onPressed,
    //   icon: Icon(
    //     Icons.logout,
    //     color: greenColor,
    //   ),
    //   label: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 100),
    //     child: CustomText(
    //       text: logOutButton,
    //       size: 18,
    //       weight: FontWeight.bold,
    //       color: greenColor,
    //     ),
    //   ),
    //   style: ButtonStyle(
    //     fixedSize: MaterialStateProperty.all(
    //       const Size(350, 65),
    //     ),
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    //     backgroundColor: MaterialStateProperty.all(greyColor),
    //   ),
    // );
  }
}
