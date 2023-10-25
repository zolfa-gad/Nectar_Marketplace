import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/constants/buttons.dart';
import '../../../data/constants/images.dart';
import '../../../data/constants/prefs.dart';
import '../../../data/constants/screens.dart';
import '../../../data/services/local_sevices.dart';
import '../../components/orange_button.dart';
import 'components/welcome_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onBoardBackgroung),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset(
              //   whiteCarrot,
              // ),
              SvgPicture.asset(
                carrotLogoSvg,
                color: Colors.white,
                height: 70,
              ),
              const WelcomeText(),
              DefaultOrangeButton(
                text: getStartedButton,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    logInScreen,
                  );
                  AppLocalServices.saveLocalData(
                    boardingPrefs,
                    true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
