import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/fonts.dart';
import '../../../data/constants/images.dart';
import '../../../data/constants/prefs.dart';
import '../../../data/constants/screens.dart';
import '../../../data/services/local_sevices.dart';
import '../../components/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) {
        if (AppLocalServices.getLocalData(boardingPrefs) != null) {
          debugPrint(
            'onBoarding: ${AppLocalServices.getLocalData(boardingPrefs)}',
          );

          if (AppLocalServices.getLocalData(tokenPrefs) != null) {
            if (AppLocalServices.getLocalData(addressPrefs) != null) {
              Navigator.of(context).pushReplacementNamed(
                homeScreen,
              );
            } else {
              Navigator.of(context).pushReplacementNamed(
                locationScreen,
              );
            }
          } else {
            Navigator.of(context).pushReplacementNamed(
              logInScreen,
            );
          }
        } else {
          Navigator.of(context).pushReplacementNamed(
            onBoardScreen,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(whiteCarrot),
            SvgPicture.asset(
              carrotLogoSvg,
              color: Colors.white,
              height: 65,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DefaultText(
                  text: 'nectar',
                  size: 72,
                  weight: FontWeight.w500,
                  color: Colors.white,
                  lineHeight: 0.9,
                  letterSpacing: 1.5,
                  fontFamily: giloryFont,
                ),
                DefaultText(
                  text: 'online marketplace',
                  size: 16,
                  weight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 4,
                  lineHeight: 0.1,
                  fontFamily: giloryFont,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
